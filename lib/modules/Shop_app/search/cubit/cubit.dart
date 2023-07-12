import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/Shop_app_model/search_model.dart';
import 'package:untitled/modules/Shop_app/search/cubit/states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class ShopSearchCubit extends Cubit<ShopSearchStates>{

  ShopSearchCubit () : super(ShopSearchInitialStates());

  static ShopSearchCubit get(context) => BlocProvider.of(context);


  SearchModel? searchModel;


  
  
  
  void GetSearchData(String text){
    emit(ShopSearchLoadingStates());
    DioHelper.PostData(url: 'products/search' , token: token,data: {
      'text': text,
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(ShopSearchSuccessStates());

    }).catchError((error){
      emit(ShopSearchErrorStates(error));
      print(error.toString());
    });
  }
  
  
}