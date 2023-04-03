import 'package:books/Fetures/SearchView/Presentation/viewModel/Search_cubit/search_cubit.dart';
import 'package:books/core/resources/textmanager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/icons.dart';
import '../../../../core/resources/values_manager.dart';
class CustomSearchFormFiled extends StatelessWidget {
  const CustomSearchFormFiled({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: SearchCubit.get(context).searchController,
      cursorColor: ColorManager.white,
      onEditingComplete: (){
        if(
        SearchCubit.get(context).searchController.text.isNotEmpty){
          SearchCubit.get(context).getSearch(
            titleSearch: SearchCubit.get(context).searchController.text,
          );
        }
      },
      style: TextStyle(
        color: ColorManager.white,
        overflow: TextOverflow.ellipsis
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.fillColor,
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorManager.primary,
            )
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorManager.gray,
            )
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
            color: ColorManager.gray1,
            fontFamily: TextManager.fontapp,
            fontSize: AppSize.s16,
        ),
        suffixIcon:Opacity(
           opacity: .4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.darkGray,
              ),
              child: IconButton(
                onPressed: (){
                  SearchCubit.get(context).getSearch(
                    titleSearch: SearchCubit.get(context).searchController.text,
                  );
                },
                icon:const Icon(IconBroken.Search),color: ColorManager.white,),
            ),
          ),
        ),
      ),
    );
  }
}
