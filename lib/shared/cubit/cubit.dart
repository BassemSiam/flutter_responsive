import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/todo_app/New_Task/Archived_Screen.dart';
import 'package:untitled/modules/todo_app/New_Task/Task_Screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import '../../modules/todo_app/New_Task/Done_Screen.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  List<Map> tasks = [];

  static AppCubit get(context) => BlocProvider.of(context);


  late Database database;


  int CurrentIndex = 0;


  List<Widget> Screen = [
    TaskScreen(),
    DonedScreen(),
    ArchivedScreen(),
  ];

  List<String> Bar = [
    "New Task",
    "Done Task ",
    "Archived Task"
  ];

  void changeIndex(int index) {
    CurrentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDataBase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print("database created");
        database.execute(
            'CREATE TABLE Tasks (ID INTEGER PRIMARY KEY , TITLE TEXT , DATE TEXT , TIME TEXT , STATUS TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print("error when creating table ${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDateBase(database)
         .then((value) {
          tasks = value;
          print(value);
          emit(AppGetDateBaseState());
        });
        print("database open");
      },

    ).then((value) {
      database = value;
      emit(AppCreateDateBaseState());
    });
  }

  insertToDatabase({
    required String Title,
    required String Time,
    required String Date
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'insert into Tasks (${Title} , ${Date} , ${Time} , STATUS ) VALUES '
              '("FIRST TASK","02222","855","New")').then((value) {
        print('${value} insert into Tasks');
        emit(AppInsertDateBaseState());
        getDataFromDateBase(database).then((value) {
          tasks = value;
          print(value);

          emit(AppGetDateBaseState());
        });
      }).catchError((Error) {
        print("error when inserting");
      });

    });
  }

  void updateDate({
    required String status,
    required int id,

  }) async {
    database.rawUpdate('UPDATE tasks Set status = ? where id = ?',
      ['$status', id],).then((value) {
      emit(AppUpdateDateBaseState());
    });
  }

  void DeleteDate({
    required int id,

  }) async {
    database.rawDelete('Delete From tasks where id = ?', [id],)
        .then((value) {
      emit(AppDeleteDateBaseState());
    });
  }

  Future<List<Map>> getDataFromDateBase(database) async {
    return await database.rawQuery('select * from Tasks');
  }

  void changeBottomSheetState(
      { required bool isShow,
        required IconData icon,}) {
    IsButtonSheet = isShow;
    fbIcon = icon;
    emit(AppChangeBottomSheetState());
  }


  bool IsButtonSheet = false;
  IconData fbIcon = Icons.add;


  bool IsDark = false;

  void changeAppMode({ FromShared}) {
          IsDark =! IsDark;
          CacheHelper.PutBoolean(key: 'IsDark', value: IsDark).then((value) {
            //print(value);
          emit(AppChangeModeState());
        });
      }
    }


