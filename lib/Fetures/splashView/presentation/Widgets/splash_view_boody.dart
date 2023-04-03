
import 'package:books/core/resources/assets.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/stylemanager.dart';
import 'package:books/core/resources/textmanager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/routs_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_indicator/loading_indicator.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody>with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
@override
  void initState() {
    super.initState();

    initSlidingAnimation();//single responsibility principle...

    nextToPage();//single responsibility principle...
  }
  @override
  void dispose() {
    //اي controller لازم يتقفل ....
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       const Image(
            image:  AssetImage(AssetsData.lImage)),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context,_) {
            return SlideTransition(
              position:slidingAnimation ,
               child: Text(
                TextManager.splashText,
                textAlign: TextAlign.center,
                style:getRegularStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s14.sp
                ),
            ),
             );
          }
        ),
        //SlidingText(slidingAnimation: slidingAnimation,),
        SizedBox(
          height: 200.h,
          child: Lottie.network(
            'https://assets8.lottiefiles.com/packages/lf20_2scSKA.json',
          ),
        ),
          SizedBox(
            height: 50.h,
          ),
          Center(
          child: SizedBox(
            height: 100,
          width: 70,
          child: LoadingIndicator(
        indicatorType: Indicator. ballSpinFadeLoader, /// Required, The loading type of the widget
        colors:  [ColorManager.white,],       /// Optional, The color collections
        strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
         backgroundColor:Colors.transparent,      /// Optional, Background of the widget
        pathBackgroundColor: Colors.black ,
        pause: false,/// Optional, the stroke backgroundColor
      ),
      ),
      ),
      ],
    );
  }
  void initSlidingAnimation(){
  animationController=AnimationController
  (
  vsync: this,
  duration:const Duration(seconds: 3)
  );
  slidingAnimation=Tween<Offset>(begin: const Offset(0,2) ,end:Offset.zero).animate(animationController);
  animationController.forward();
}

  void nextToPage(){
  Future.delayed(const Duration(seconds: 5),(){
    Navigator.pushReplacementNamed(context, NameRout.homeRoute,);
  });
}
}


