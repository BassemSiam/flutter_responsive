import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';
import 'package:untitled/models/Shop_app_model/Categories_model.dart';
import 'package:untitled/models/Shop_app_model/Favorites_Get_model.dart';
import 'package:untitled/models/Shop_app_model/Favorites_model.dart';
import 'package:untitled/models/Shop_app_model/Home_model.dart';
import 'package:untitled/models/Shop_app_model/Login_model.dart';
import 'package:untitled/modules/Shop_app/cateogries/Categories_Screen.dart';
import 'package:untitled/modules/Shop_app/favorites/Favorites_screen.dart';
import 'package:untitled/modules/Shop_app/products/products_screen.dart';
import 'package:untitled/modules/Shop_app/settings/Settings_Screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../shared/network/remote/End_point.dart';

class ShopCubit extends Cubit<ShopStates> {

  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;


  Map<int, bool> Favorites = {};

  List<Widget> BottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];


  void ChangeBottomNav(index) {
    CurrentIndex = index;
    emit(ShopChangeBottomNavState());
  }


  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,
        token: token)
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      //print(homeModel!.data!.products![1].id);
      homeModel!.data!.products!.forEach((element) {
        Favorites.addAll({
          element.id!: element.inFavorites!
        });
      });
      //print(Favorites);
      // print(homeModel!.data?.banners![1].id);
      // print(homeModel!.data?.banners![1].image);
      // print(homeModel!.data?.products![1].id);
      // print(homeModel!.data?.products![1].image);
      // print(homeModel!.status);
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(url: CATEGORIES)
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesDataState(error));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void ChangeFavorites(int productId) {
    Favorites[productId] = !Favorites[productId]!;
    emit(ShopSuccessChangeFavoritesState());

    DioHelper.PostData
      (url: FAVORITES, token: token
        , data: {'product_id': productId,})
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      emit(ShopSuccessChangeFavoritesState());

      if (!changeFavoritesModel!.status!) {
        Favorites[productId] = !Favorites[productId]!;
      } else {
        getFavoritesData();
      }
    }).catchError((error) {
      print(error.toString());
      Favorites[productId] = !Favorites[productId]!;
      emit(ShopErrorChangeFavoritesState(error));
    });
  }

  GetFavoritesModel? getFavoritesModel;

  void getFavoritesData() {
    DioHelper.getData(url: FAVORITES, token: token,)
        .then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);
      //print(value.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState(error));
    });
  }

  ShopLoginModel? getProfile;

  void GetProfileData() {
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      getProfile = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessGetProfileState());
      print(getProfile!.data!.name);
    }).catchError((error) {
      print(error.toString);
      emit(ShopErrorGetProfileState(error));
    });
  }


  void UpdateProfile(
      {required String name, required String email, required String phone }) {
    emit(ShopLoadingUpdateProfileState());
    DioHelper.PutData(token: token, url: 'update-profile',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        }
    ).then((value) {
      getProfile = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateProfileState());
    }).catchError((error) {
      emit(ShopErrorUpdateProfileState(error));
      print(error.toString());
    });
  }


  ShopLoginModel? ChangePass;

  void ChangePassword({
    required String Current, required String New }) {
    DioHelper.PostData( url: 'change-password', data: {
      'current_password': Current,
      'new_password': New}
      , token: token,
    ).then((value) {
      ChangePass = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessChangePassState());
    }).catchError((error) {
      emit(ShopErrorChangePassState(error));
      print(error.toString());
    });
  }
}