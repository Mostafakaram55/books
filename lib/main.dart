import 'package:books/Fetures/homeView/data/repository/home_repo_implementation.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/Service_locator.dart';
import 'package:books/core/resources/api_service.dart';
import 'package:books/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'Fetures/homeView/presentation/viewmodel/fetured_books_cubit/fetured_books_cubit.dart';
import 'Fetures/homeView/presentation/viewmodel/newset_books_cubit/newset_books_cubit.dart';
import 'Fetures/splashView/presentation/view/splashscreen.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/local_service.dart';
import 'core/resources/routs_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  setUp();//استدعيها هنا علشان يضمن الاتصال بالخادم الخاصه به
  await CacheHelper.init();
   bool? isDark=CacheHelper.getBoolData(key: 'isDark');
  runApp(BooklyApp(isDark!));
}
class BooklyApp extends StatelessWidget {
     BooklyApp(this.isDark);
   final bool isDark;
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      builder: (BuildContext context,child) {
        return  MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context)=>FeaturedBooksCubit(
                getIt.get<HomeRepoImplementation>(),
              )..fetchFeatureBooks(),
            ),
            BlocProvider(
              create: (context)=>NewestBooksCubit(
                getIt.get<HomeRepoImplementation>(),
              )..fetchNewestBooks(),
            ),
            BlocProvider(
              create: (context)=>changAppCubit()..changeAppMode(
                fromShared: isDark
              ),
            ),
          ],
          child:BlocBuilder<changAppCubit,ChangeAppState>(
            builder: (context,state){
              return  MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: NameRout.splashRoute,
                onGenerateRoute: RouteGenerator.getRout,
                theme: ThemeData().copyWith(
                  scaffoldBackgroundColor:Colors.grey[300],
                ),
                darkTheme: ThemeData().copyWith(
                    scaffoldBackgroundColor: ColorManager.primary,
                ),
                themeMode:changAppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                home:const SplashView(),
              );
            },
          ),
        );
      },
    );
  }
}




