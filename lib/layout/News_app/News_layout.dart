import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/layout/News_app/Cubit/cubit.dart';
import 'package:untitled/layout/News_app/Cubit/states.dart';
import 'package:untitled/modules/News_app/search/search_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../shared/network/local/cache_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener:(context, state) {} ,
      builder: (context, state) {
        var Cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News app"),
            actions: [
              IconButton(
                  onPressed: (){
                    navigatorTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () async {
                    AppCubit.get(context).changeAppMode();

                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: Cubit.Screens[Cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: Cubit.CurrentIndex,
              onTap: (index) {
                Cubit.ChangeBottomNavItems(index);
              },
              items: Cubit.BottomItems),
        );
      },
    );
  }
}
