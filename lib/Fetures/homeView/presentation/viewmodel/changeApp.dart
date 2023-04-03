import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/local_service.dart';
import 'newset_books_cubit/changAppState.dart';
class changAppCubit extends Cubit<ChangeAppState>{
  changAppCubit():super(changInitialMode());
  static changAppCubit get(BuildContext context)=>BlocProvider.of(context);
  bool isDark=true;
  void changeAppMode({
   bool? fromShared,
}){
    if(fromShared !=null){
      isDark=fromShared;
      emit(changMode());
    }else{
      isDark=!isDark;
      CacheHelper.putBoolData(key: 'isDark', value: isDark).then((value){
        emit(changMode());
      });
    }
  }

}