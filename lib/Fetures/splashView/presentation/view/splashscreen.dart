
import 'package:flutter/material.dart';
import '../Widgets/splash_view_boody.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: SplashViewBody(),
    );
  }
}
