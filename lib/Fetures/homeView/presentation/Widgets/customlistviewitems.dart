import 'package:books/core/resources/assets.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routs_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_indicator/loading_indicator.dart';
class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7/4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                  colorFilter:
                 const  ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) =>  Center(child: SizedBox(
            height: 30,
            width: 30,
            child: LoadingIndicator(
              indicatorType: Indicator.ballRotateChase, /// Required, The loading type of the widget
              colors:  [ColorManager.white,],       /// Optional, The color collections
              strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
              backgroundColor: Colors.transparent,      /// Optional, Background of the widget
              pathBackgroundColor: Colors.black ,
              pause: false,/// Optional, the stroke backgroundColor
            ),
          )),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}