import 'package:flutter/material.dart';

/*class ChooseYourExperience extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Material(
     child: SingleChildScrollView(
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
        ]
       ),
     ),
   );
  }

}*/

import 'package:flutter/material.dart';
import 'package:traveller/core/resources/routes_manager/route_manager.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/routes_manager/routes.dart';

class ChooseYourExperience extends StatelessWidget {
  const ChooseYourExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Choose Your Experience",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover Egypt",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "Choose what you would like to experience during your trip.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 25),

            _ExperienceCard(
              title: "Foods",
              subtitle: "Taste authentic Egyptian cuisine",
              image: AssetsManager.foods,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.foodScreen);
              },
            ),

            const SizedBox(height: 18),

            _ExperienceCard(
              title: "Attractions",
              subtitle: "Explore Egypt's History",
              image: AssetsManager.giza,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.attractions);
                // Navigator.pushNamed(
                //   context,
                //   RoutesName.religionScreen,
                // );
              },
            ),

            const SizedBox(height: 18),

            _ExperienceCard(
              title: "Traffic",
              subtitle: "Choose your preferred transportation",
              image: AssetsManager.traffic,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.transportation);
                // Navigator.pushNamed(
                //   context,
                //   RoutesName.trafficScreen,
                // );
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  const _ExperienceCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),

      child: Container(
        height: 190,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.75),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 20,
                right: 20,
                bottom: 18,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
