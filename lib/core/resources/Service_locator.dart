import 'package:books/Fetures/SearchView/data/repository/home_repo_impl.dart';
import 'package:books/Fetures/homeView/data/repository/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'api_service.dart';

//caret copy of getIt.
final getIt=GetIt.instance;
//caret service ..
void setUp(){
  //عملنا نسخه واحده بس من (apiService) علشان مقعدش اخد نسخه كمان منها في كل كلاس يعتمد عليها
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  //caret object of class HomeRepo ,وهو شايل كل حاجه اصلاااا
 getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(
   getIt.get<ApiService>()));

getIt.registerSingleton<HomeRepoImpSearch>(HomeRepoImpSearch(
  getIt.get<ApiService>()));
}
