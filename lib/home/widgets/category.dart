import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name ;
  String image ;

   CategoryItem({required this.name , required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Text(name),
        SizedBox(height: 10,)
      ]

    );
  }
}
