
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/stylemanager.dart';
import 'package:books/core/resources/textmanager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CarouselSlider_view.dart';
import 'customappbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_view_boody_item.dart';
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key,}) : super(key: key);
  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CustomAppBar(),
              const CarouselSliderView(),
              SizedBox(
                height: AppSize.s17.h,
              ),
              BlocBuilder<changAppCubit,ChangeAppState>(
                builder: (context,state){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:AppSize.s18),
                    child: Text(
                      TextManager.BestSeller,
                      style: GoogleFonts.montserrat(
                        textStyle:getSemiBoldStyle(
                            color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                            fontSize: AppSize.s17
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppSize.s14.h,
              ),
            ],
          ),
        ),
          const SliverToBoxAdapter(
          child:BestSellerListView() ,
        ),
      ],
    );
  }
  
}










