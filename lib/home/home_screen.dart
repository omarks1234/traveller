

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveller/core/resources/assets_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/register/firebase_services.dart';
import 'package:traveller/home/widgets/category.dart';
import 'package:traveller/home/widgets/monument_widget.dart';
import 'package:traveller/models/monument.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index != tabIndex) {
        setState(() {
          tabIndex = tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traveller")),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Egypt"),
              Tab(text: "Make your program"),
              Tab(text: "Favorites"),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.foodScreen);
                          },
                          child: CategoryItem(
                            name: "Foods",
                            image: AssetsManager.foods,
                          ),
                        ),
                        CategoryItem(
                          name: "Religion",
                          image: AssetsManager.religions,
                        ),
                        CategoryItem(
                          name: "Traffic",
                          image: AssetsManager.traffic,
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Where do you want to go ? "),
                        SizedBox(height:10.h),
                         InkWell(
                         onTap: () {
                         Navigator.pushNamed(context, RoutesName.cairoPlacesScreen);
                         },
                         child: ClipRRect(
                         borderRadius: BorderRadius.circular(20.r),
                         child: Image.asset(AssetsManager.cairo ))),
                        SizedBox(height:10.h),
                        ClipRRect(
                             borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(AssetsManager.hurgada )),
                        SizedBox(height:10.h),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(AssetsManager.sharm )),
                        SizedBox(height:10.h),
                        InkWell(
                             onTap: () {
                               Navigator.pushNamed(context, RoutesName.gizaPlacesScreen);
                             },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.asset(AssetsManager.giza ))),
                        SizedBox(height:10.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.luxorPlacesScreen);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(AssetsManager.luxor )),
                        ),
                        SizedBox(height:10.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.aswanPlacesScreen);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(AssetsManager.aswan )),
                        ),
                        SizedBox(height:10.h),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(AssetsManager.oases )),


                      ],
                    ),
                  ),

                  FutureBuilder(future: FireBaseServices.readUserData(FirebaseAuth.instance.currentUser!.uid) , builder: (context, snapshot) {

                       if (snapshot.connectionState == ConnectionState.waiting){
                         return Center(child: CircularProgressIndicator(),);
                       }
                       if(snapshot.hasError){
                         print("********************************************");
                         return Center(child: Text(snapshot.error.toString()),);

                       }
                       final user = snapshot.data;
                     List<MonumentWidget>favMon = user!.favoriteMonuments!.map((monument) =>MonumentWidget(monument , isFav: true,) ,).toList() ;
                        return ListView.separated(itemBuilder: (context, index) => favMon[index] , separatorBuilder:(context, index) => SizedBox(height: 10.h,), itemCount:favMon.length );


                  },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
