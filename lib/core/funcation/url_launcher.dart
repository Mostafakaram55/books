import 'package:books/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void>LauncherCustomUrl(context,String? url)async{
  if(url!=null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      !await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
            'Not Preview Book $url',
            style: TextStyle(
                color: ColorManager.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
            ),
          ),
            backgroundColor: Colors.red,
          )
      );
    }
  }
}