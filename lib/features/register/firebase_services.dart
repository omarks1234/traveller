import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/models/user.dart';
@singleton
class FireBaseServices {
  Future<String> createEmail(String email , String password)async{
     try{
     final userCredential = await  FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email,
           password: password);
     print('You have been registered.${userCredential.user!.uid}');
     return "you have been Registered" ;
     }on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         print('The password provided is too weak.');
       }else if (e.code == 'email-already-in-use') {
         print('The account already exists for that email.');
       }
       return "failed to register" ;
     }catch (e){
       print(e);
       return "There is a problem in connection";
     }
  }
   static Future<CollectionReference<TravellerUser>>
  fireStoreInit(String userId)async{

   final db = await FirebaseFirestore.instance;
   final docRef = db.collection("users").withConverter(
     fromFirestore:TravellerUser.fromJson ,
     toFirestore: (user, options) => user.toJson()  ,);
   return docRef ;

  }
  Future<void>saveUserData(TravellerUser user)async{

    final docRef = await fireStoreInit(user.userId!);
    final doc =docRef.doc(user.userId!);
    return  await doc.set(user) ;

  }
}

