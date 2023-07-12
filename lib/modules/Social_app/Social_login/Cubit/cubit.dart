import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/Shop_app_model/Login_model.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/modules/Shop_app/Login/Cubit/states.dart';
import 'package:untitled/modules/Social_app/Social_login/Cubit/states.dart';
import 'package:untitled/shared/network/remote/End_point.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';


class SocialLoginCubit extends Cubit<SocialLoginState>{

  SocialLoginCubit() : super (SocialLoginInitialState());



  static SocialLoginCubit get(context) => BlocProvider.of(context);
  //SocialLoginModel ?loginModel;

  bool IsShow = true;
  IconData SufixIcon = Icons.visibility;
  void ChangePasswordVisabilty(){
    IsShow = !IsShow;
    SufixIcon = IsShow ? Icons.visibility : Icons.visibility_off;
    emit(SocialLoginChangeIconState());

  }

  void userLogin({required  String email,
                  required  String password}){
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      print(error.toString());
      emit(SocialLoginErrorState(error.toString()));
    }
    );
  }


}