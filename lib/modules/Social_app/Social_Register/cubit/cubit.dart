import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/Social_app_model/Social_User_model.dart';
import 'package:untitled/modules/Social_app/Social_Register/cubit/states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/End_point.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState>{

  SocialRegisterCubit () :super(SocialRegisterInitialState());


  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  bool IsShow = true;
  // SocialLoginModel? RegisterModel;

  IconData SufixIcon = Icons.visibility;
  void ChangePasswordVisabilty(){
    IsShow = !IsShow;
    SufixIcon = IsShow ? Icons.visibility : Icons.visibility_off;
    emit(SocialRegisterChangeIconState());

  }


  void RegisterData({required String name ,
    required String email ,
    required String password ,
    required String phone} ){
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword
      (email: email, password: password).then((value) {
        print(value.user!.email);
        print(value.user!.uid);

        CreateUser(
          uId:value.user!.uid,
          phone: phone,
          email: email,
          name: name,

        );

    }).catchError((error){
    print(error.toString());
    emit(SocialRegisterErrorState(error.toString()));
    });
  }


  void CreateUser({
    required String email ,
    required String name ,
    required String phone,
    required String uId }){

    SocialUserModel socialUserModel =
    SocialUserModel(
        name,
        email,
        phone,
        uId,
        'https://www.muhtwa.com/wp-content/uploads/Screenshot_2017-03-11-23-42-30-1.png',
        'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg',
        'write you bio...',
        false);

    FirebaseFirestore.instance.collection('users').doc(uId).
    set(socialUserModel.toJson()).then((value) {

      emit(SocialCreateUserSuccessState());

    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
      print(error.toString());
    });


}

}