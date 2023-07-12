import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News_app/Cubit/cubit.dart';
import 'package:untitled/layout/News_app/Cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = NewsCubit.get(context).Science;
        return  ArticleBuilder(List,context);
      },

    );
  }
}
