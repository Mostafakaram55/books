
import 'package:books/core/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShimmerFatchedBooks extends StatelessWidget {
  const ShimmerFatchedBooks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context,index,s)=>const AspectRatio(
        aspectRatio: 2.7/4,
        child:  ShimmerContainerEffect(
          width: 100,
          height: 100,
          borderRadius:  10,
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.5,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
      ),
    );
  }
}
