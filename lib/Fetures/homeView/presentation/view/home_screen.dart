import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/homviewbody.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key, }) : super(key: key);
 //final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<changAppCubit, ChangeAppState>(
              builder: (context, state) {
            return  const HomeViewBody();
      }),
    );
  }
}
