import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/Fetures/homeView/data/repository/home_repo.dart';
import 'package:books/core/errors/failures.dart';
import 'package:books/core/resources/api_service.dart';
import 'package:dartz/dartz.dart';
class HomeRepoImplementation implements HomeRepo{
  final ApiService apiService;
  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewSetBooks()async {
    // defined  my requests
    try{
      var data =await apiService.getData(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=Cyber security',
      );
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch(errorM){
      return left(ServerFailure(errorM.toString()));
    }
  }
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{
      var data =await apiService.getData(
          endPoint: 'volumes?Filtering=free-ebooks&q=google');
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch(errorM){
      return left(ServerFailure(errorM.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async
  {
    try{
      var data =await apiService.getData(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:google');
      List<BookModel>books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }on Exception catch(errorM){
      return left(ServerFailure(errorM.toString()));
    }
  }

  }

