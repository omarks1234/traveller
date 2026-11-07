import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/chooseExperience/data/models/attraction.dart';

import '../chooseExperience/data/models/trip.dart';
@singleton
class FireBaseServices {
  Future<String> createEmail(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
      print('You have been registered.${userCredential.user!.uid}');
      return "you have been Registered";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return "failed to register";
    } catch (e) {
      print(e);
      return "There is a problem in connection";
    }
  }

  static Future<CollectionReference<TravellerUser>>
  fireStoreInit(String userId) async {
    final db = await FirebaseFirestore.instance;
    final docRef = db.collection("users").withConverter(
      fromFirestore: TravellerUser.fromJson,
      toFirestore: (user, options) => user.toJson(),);
    return docRef;
  }

  Future<String> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return "Login has been done successfully ";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "Wrong password provided for that user.";
      }
      return "";
    } catch (err) {
      // toast message
      return "There is a problem in internet connection";
    }
  }

  Future<void> saveUserData(TravellerUser user) async {
    final docRef = await fireStoreInit(user.userId!);
    final doc = docRef.doc(user.userId!);
    return await doc.set(user);
  }

  static Future<void> modifyUserData(String userId,Map<String, dynamic> map) async {
    final docRef = await fireStoreInit(userId);
    final doc = docRef.doc(userId);
    return await doc.update({map.keys:map.values});
  }

  Future<void> savepreferences(Map<String, dynamic> userPreferences) async {
    final docRef = await fireStoreInit(FirebaseAuth.instance.currentUser!.uid);
    final doc = docRef.doc(FirebaseAuth.instance.currentUser!.uid);
    return await doc.update({"userPreferenceModel": userPreferences});
  }

  static Future<TravellerUser?> readUserData(String userId) async {
    final docRef = await fireStoreInit(userId); // docRef is collection
    final doc = docRef.doc(userId);
    final snapshot = await doc.get();
    final travellerUser = snapshot.data();
    return travellerUser;
  }

  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

/*  Future<CollectionReference<Map<String, dynamic>> > createTripCollection(String userId, Map<String , dynamic> trip) async {
  }*/


    /***********createTripCollection***********/
  Future<String > createTripCollection(String userId , Map<String,dynamic> preferences) async {
    final tripRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trips');

       final tripDoc = tripRef.doc() ;
       tripDoc.set(
         {

            'tripId': tripDoc.id,

         }
       );
      return tripDoc.id ;

  }
   Future<Trip> getTripById (String uid,String tripId)async{
     final doc = await FirebaseFirestore.instance
         .collection('users')
         .doc(uid)
         .collection('trips')
         .doc(tripId)
         .get();

     if (!doc.exists || doc.data() == null) {
       print('Trip not found');
       throw Exception('Trip not found');
     }
     return Trip.fromJson(doc.data()!);
   }

   /**************Modify******************/

     Future<void> modifyTripCollection(String userId , String tripId , Map<String,dynamic> trip) async {
       final tripDoc = FirebaseFirestore.instance
           .collection('users')
           .doc(userId)
           .collection('trips');
    await tripDoc.doc(tripId).set(
      trip,
      SetOptions(merge: true),
    );
  }


}
