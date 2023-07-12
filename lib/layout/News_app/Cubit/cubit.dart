import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News_app/Cubit/states.dart';
import 'package:untitled/modules/News_app/business/business_screen.dart';
import 'package:untitled/modules/News_app/science/science_screen.dart';
import 'package:untitled/modules/News_app/sports/sports_screen.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<BottomNavigationBarItem> BottomItems = [
   BottomNavigationBarItem(
       icon: Icon(
         Icons.business,
       ),
       label: "Business",

   ),
   BottomNavigationBarItem(
       icon: Icon(
         Icons.sports,
       ),
       label: "Sports",

   ),
   BottomNavigationBarItem(
       icon: Icon(
         Icons.science,
       ),
       label: "Science",

   ),

  ];

  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void ChangeBottomNavItems(int index){
    if(index == 1){
      getSport();
    }else if(index == 2){
      getScience();
    }
    CurrentIndex = index;
    emit(NewsBottomNavState());
}

List <dynamic> Business = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {'country':'eg' ,
        'category':'business' ,
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,
      },).then((value) {
        Business = value.data['articles'];
        print(Business[0]['title']);

        emit(NewsGetBusinessSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(NewsGetBusinessErrorState(Error.toString()));
    });
  }

  List <dynamic> Sport = [];

  void getSport(){


    emit(NewsGetSportLoadingState());
    
    if (Sport.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg' ,
          'category':'sports' ,
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,
        },).then((value) {
        Sport = value.data['articles'];
        print(Sport[0]['title']);

        emit(NewsGetSportSuccessState());
      }).catchError((Error){
        print(Error.toString());
        emit(NewsGetSportErrorState(Error.toString()));
      });
    }else {
      emit(NewsGetSportSuccessState());
    }
    
  }

  List <dynamic> Science = [];

  void getScience(){
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {'country':'eg' ,
        'category':'science' ,
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,
      },).then((value) {
      Science = value.data['articles'];
      print(Science[0]['title']);

      emit(NewsGetScienceSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(NewsGetScienceErrorState(Error.toString()));
    });
  }

  List <dynamic> Search = [];

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,
      },).then((value) {
      Search = value.data['articles'];
      print(Search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((Error){
      print(Error.toString());
      emit(NewsGetSearchErrorState(Error.toString()));
    });
  }
}