import 'package:ecommproject/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarousalImages extends StatelessWidget {
  const CarousalImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((e) {
          return Builder(
              builder: ((context) => Image.network(e, fit: BoxFit.cover)));
        }).toList(),
        options: CarouselOptions(viewportFraction: 1));
  }
}
