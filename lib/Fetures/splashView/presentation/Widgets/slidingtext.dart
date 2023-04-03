
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SlidingText extends StatelessWidget {
  const SlidingText({Key? key,
    required this.slidingAnimation
  }) : super(key: key);
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_) {
        return SlideTransition(
          position:slidingAnimation ,
          child: Lottie.network(
            'https://assets8.lottiefiles.com/packages/lf20_2scSKA.json',
            //controller:,
          ),
        );
      },
    );
  }
}