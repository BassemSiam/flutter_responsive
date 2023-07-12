import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData LightTheme = ThemeData(
    textTheme: TextTheme(bodyText1:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black) ),
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed ,
      selectedItemColor: Colors.teal,
      backgroundColor: Colors.white,
      elevation: 20,
    ),
      dividerColor: Colors.grey,
       primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
);
ThemeData DarkTheme = ThemeData(
  textTheme: TextTheme(bodyText1:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white) ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:Colors.deepOrange,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739') ,
        statusBarIconBrightness: Brightness.light),
    titleTextStyle: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed ,
      selectedItemColor: Colors.deepOrange,
      backgroundColor: HexColor('333739'),
      elevation: 20,
      unselectedItemColor: Colors.grey
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  backgroundColor: HexColor('333739'),
  dividerColor: Colors.grey,
  primarySwatch: Colors.deepOrange,
);
