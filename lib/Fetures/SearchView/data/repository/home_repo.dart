import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
abstract class HomeRepoSearch{
  Future<Either<Failure,List<BookModel>>>searchBook({required String titleSearch});
}