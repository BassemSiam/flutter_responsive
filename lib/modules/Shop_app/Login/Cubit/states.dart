
import 'package:untitled/models/Shop_app_model/Login_model.dart';

abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState{}

class ShopLoginSuccessState extends ShopLoginState{
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);

}

class ShopLoginLoadingState extends ShopLoginState{}

class ShopLoginChangeIconState extends ShopLoginState{}

class ShopLoginErrorState extends ShopLoginState{
  final String error ;

  ShopLoginErrorState(this.error);
}