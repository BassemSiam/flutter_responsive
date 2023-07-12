import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/Shop_app_model/Login_model.dart';
import 'package:untitled/modules/Shop_app/Register/cubit/states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/End_point.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState>{

  ShopRegisterCubit () :super(ShopRegisterInitialState());


  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool IsShow = true;
  ShopLoginModel? RegisterModel;

  IconData SufixIcon = Icons.visibility;
  void ChangePasswordVisabilty(){
    IsShow = !IsShow;
    SufixIcon = IsShow ? Icons.visibility : Icons.visibility_off;
    emit(ShopRegisterChangeIconState());

  }


  void RegisterData({required String name ,
    required String email ,
    required String password ,
    required String phone} ){
    DioHelper.PostData(url: REGISTER,
        token: token ,
        data:
        { 'name':name ,
          'email':email ,
          'password':password ,
          'phone':phone , } ).then((value) {

            RegisterModel = ShopLoginModel.fromJson(value.data);
           emit(ShopRegisterSuccessState());
            print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    }
    );
  }




}