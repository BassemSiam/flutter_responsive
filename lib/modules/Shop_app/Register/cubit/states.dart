abstract class ShopRegisterState {}

class ShopRegisterInitialState extends ShopRegisterState{}

class ShopRegisterLoadingState extends ShopRegisterState{}

class ShopRegisterSuccessState extends ShopRegisterState{}

class ShopRegisterChangeIconState extends ShopRegisterState{}

class ShopRegisterErrorState extends ShopRegisterState{
  final String error;

  ShopRegisterErrorState(this.error);
}
