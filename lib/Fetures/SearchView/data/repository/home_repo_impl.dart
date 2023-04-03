import 'package:books/Fetures/SearchView/data/repository/home_repo.dart';
import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/core/errors/failures.dart';
import 'package:books/core/resources/api_service.dart';
import 'package:dartz/dartz.dart';
class HomeRepoImpSearch implements HomeRepoSearch{
  final ApiService apiService;
  HomeRepoImpSearch(this.apiService,);
   String? titleSearch;
  @override
  Future<Either<Failure, List<BookModel>>> searchBook({required String titleSearch}) async
  {
  try{
    var searchData=await apiService.getData(endPoint:'volumes?Filtering=free-ebooks&Sorting=newest &q=$titleSearch');
    List<BookModel>books=[];
    for(var item in searchData['items']){
      books.add(BookModel.fromJson(item));
    }
    return right(books);
  }on Exception catch(errorM){
    return left(ServerFailure(errorM.toString()));
  }
  }
}