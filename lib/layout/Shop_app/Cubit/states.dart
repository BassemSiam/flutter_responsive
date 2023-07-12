abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{
  final String error;

  ShopErrorHomeDataState(this.error);

}

class ShopSuccessCategoriesDataState extends ShopStates{}

class ShopErrorCategoriesDataState extends ShopStates{
  final String error;

  ShopErrorCategoriesDataState(this.error);

}

class ShopSuccessChangeFavoritesState extends ShopStates{}

class ShopErrorChangeFavoritesState extends ShopStates{
  final String error;

  ShopErrorChangeFavoritesState(this.error);

}

class ShopSuccessGetFavoritesState extends ShopStates{}

class ShopErrorGetFavoritesState extends ShopStates{
  final String error;

  ShopErrorGetFavoritesState(this.error);

}class ShopSuccessGetProfileState extends ShopStates{}

class ShopErrorGetProfileState extends ShopStates{
  final String error;

  ShopErrorGetProfileState(this.error);

}

class ShopLoadingUpdateProfileState extends ShopStates{}

class ShopSuccessUpdateProfileState extends ShopStates{}

class ShopErrorUpdateProfileState extends ShopStates{
  final String error;

  ShopErrorUpdateProfileState(this.error);

}

class ShopLoadingChangePassState extends ShopStates{}

class ShopSuccessChangePassState extends ShopStates{}

class ShopErrorChangePassState extends ShopStates{
  final String error;

  ShopErrorChangePassState(this.error);

}