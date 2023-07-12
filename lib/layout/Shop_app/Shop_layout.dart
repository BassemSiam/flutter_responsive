import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';
import 'package:untitled/modules/News_app/search/search_screen.dart';
import 'package:untitled/modules/Shop_app/Login/Shop_login_screen.dart';
import 'package:untitled/modules/Shop_app/search/Search_Screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener:(context, state) {
      },
      builder: (context, state) {
        var Cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(' B.S   Shop '),
          actions: [
            IconButton(onPressed:(){
              navigatorTo(context, ShopSearchScreen());
            },
                icon: Icon(Icons.search)),
          ],
          ),
          body: Cubit.BottomScreens[Cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Cubit.CurrentIndex,
            onTap: (index){
              Cubit.ChangeBottomNav(index);
            },
            items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'),
          ]),
        );
      },
    );
  }
}
