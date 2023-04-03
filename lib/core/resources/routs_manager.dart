import 'package:books/Fetures/SearchView/Presentation/viewModel/Search_cubit/search_cubit.dart';
import 'package:books/Fetures/SearchView/Presentation/views/SearchView.dart';
import 'package:books/Fetures/SearchView/Presentation/widgets/searchview_body.dart';
import 'package:books/Fetures/SearchView/data/repository/home_repo_impl.dart';
import 'package:books/Fetures/homeView/data/Models/booksModel.dart';
import 'package:books/Fetures/homeView/data/repository/home_repo.dart';
import 'package:books/Fetures/homeView/presentation/view/book_details_view.dart';
import 'package:books/Fetures/homeView/presentation/view/home_screen.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/Simillar_books_cubit/similar_books_cubit.dart';
import 'package:books/Fetures/splashView/presentation/view/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Fetures/homeView/data/Models/book_model.dart';
import '../../Fetures/homeView/data/repository/home_repo_implementation.dart';
import 'Service_locator.dart';

class NameRout{
  static const splashRoute='/';
  static const homeRoute='/homeView';
  static const detailsRoute='/detailsView';
  static const searchRoute='/searchView';
}

class RouteGenerator{
  static Route<dynamic>getRout(RouteSettings settings){
switch(settings.name){
  case NameRout.splashRoute:
    return MaterialPageRoute(builder: (_)=> const SplashView());
  case NameRout.homeRoute:
    //final bookModel = settings.arguments as BookModel;
    return MaterialPageRoute(builder: (_)=> const  HomeView(
      //bookModel: bookModel,
    ));
  case NameRout.detailsRoute:
    final bookModel = settings.arguments as BookModel;//السطر ده مكنتش فاهم بيعمل اي
    return MaterialPageRoute(
        builder: (_)=> BlocProvider(
         create: (context){
           return SimilarBooksCubit(getIt.get<HomeRepoImplementation>());
         },
          child: BookDetailsView(
          bookModel: bookModel,
        )));
  case NameRout.searchRoute:
    return MaterialPageRoute(builder: (_)=> BlocProvider(
      create: ((context) {
        return SearchCubit(getIt.get<HomeRepoImpSearch>());
      }),
        child: const SearchView()
    ));
}
return noFoundRoute();
}

  static Route<dynamic>noFoundRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(
        title: const Text('NO FOUND ROUT'),
      ),
    )
    );
  }
}
