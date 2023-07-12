import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class homeLayout extends StatelessWidget
{


  var scafoldKeys =GlobalKey<ScaffoldState>();
  var formKeys =GlobalKey<FormState>();

  var TitelControlar = TextEditingController();
  var timeControlar = TextEditingController();
  var dateControlar = TextEditingController();

  Future<String> getName () async
  {
    return "Bassem Siam";
  }
  // @override
  // void initState() {
  //   super.initState();
  //   createDataBase();
  // }
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit , AppStates >(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDateBaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit Cubit = AppCubit.get(context);
          return Scaffold(
            key: scafoldKeys,
            body: ConditionalBuilder(
              builder: (context) =>  Cubit.Screen[Cubit.CurrentIndex],
              condition:true,
              fallback: (context) => Center(child: CircularProgressIndicator()),) ,
            appBar: AppBar(
              title: Text
                (
                  Cubit.Bar[Cubit.CurrentIndex]
              ),
            ),
            floatingActionButton:FloatingActionButton(
              onPressed: ()

              {if(Cubit.IsButtonSheet)
              {
                if(formKeys.currentState!.validate()){
                  Cubit.insertToDatabase(
                      Date: dateControlar.text,
                      Time: timeControlar.text,
                      Title:TitelControlar.text);
                  //     .then((value) {
                  //   Navigator.pop(context);
                  //   IsButtonSheet = false;
                  //   // setState(() {
                  //   //   fbIcon = Icons.add;
                  //   // });
                  //
                  // });

                }
              }
              else
              {
                scafoldKeys.currentState!.showBottomSheet
                  ((context) =>Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: formKeys,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: TitelControlar,
                          validator: (value) {
                            if(value!.isEmpty){
                              return("Please select ");
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              label: Text("Task"),
                              prefixIcon: Icon(Icons.title)
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: timeControlar,
                          validator: (value) {
                            if(value!.isEmpty){
                              return("Please select ");
                            }
                          },
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(context: context,
                                initialTime: TimeOfDay.now()).
                            then((value) {
                              timeControlar.text=value!.format(context).toString();
                              print(value.format(context));
                            });
                          },
                          decoration: InputDecoration(
                              label: Text("Task Time"),
                              prefixIcon: Icon(Icons.watch_later_outlined)
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: dateControlar,
                          validator: (value) {
                            if(value!.isEmpty){
                              return("Please select date ");
                            }
                          },
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("2024-05-05")).
                            then((value) {
                              dateControlar.text =DateFormat.yMMMd().format(value!);

                            });
                          },
                          decoration: InputDecoration(
                              label: Text("Task Date"),
                              prefixIcon: Icon(Icons.calendar_month)
                          ),
                        ),
                      ],
                    ),
                  ),
                ) ).closed.then((value) {
                  Navigator.pop(context);
                  Cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit);
                });
                Cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add);
              }
              },
              child: Icon(Cubit.fbIcon
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: Cubit.CurrentIndex,
                onTap: (index){
                  Cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      label: "Task"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check_circle_outline),
                      label: "Done"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined),
                      label: "Archived"
                  ),
                ]),
          );
        },
      ),
    );

  }

}

