import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/Shop_app_model/Login_model.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/modules/Shop_app/Login/Cubit/states.dart';
import 'package:untitled/shared/network/remote/End_point.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';


class ShopLoginCubit extends Cubit<ShopLoginState>{

  ShopLoginCubit() : super (ShopLoginInitialState());



  static ShopLoginCubit get(context) => BlocProvider.of(context);
  //ShopLoginModel ?loginModel;

  bool IsShow = true;
  IconData SufixIcon = Icons.visibility;
  void ChangePasswordVisabilty(){
    IsShow = !IsShow;
    SufixIcon = IsShow ? Icons.visibility : Icons.visibility_off;
    emit(ShopLoginChangeIconState());

  }

  void userLogin({required  String email,
                  required  String password}){
    emit(ShopLoginLoadingState());
    DioHelper.PostData(url: LOGIN,
      data: {
      'email':email,
      'password':password,
    },).then((value) {
      ShopLoginModel LoginModel =
      ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(LoginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    }
    );
  }


}