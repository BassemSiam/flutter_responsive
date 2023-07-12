import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      builder: ( context, state) {
        var tasks = AppCubit.get(context).tasks;
        return ListView.separated(itemBuilder: (context, index) => bulidTaskItem(),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: tasks.length );
      },
      listener: ( context, state) {  },

    );
  }


}