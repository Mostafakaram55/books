
import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/Fetures/homeView/presentation/Widgets/book_details_view_body.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/Simillar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key,required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}
class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    SimilarBooksCubit.get(context).fetchSimilarBooks(category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BookDetailsBody(bookModel:widget.bookModel),
    );
  }
}
