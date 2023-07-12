import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/modules/Social_app/NewPost_screen/NewPost_screen.dart';
import 'package:untitled/modules/Social_app/Social_login/Social_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/styles/icons_broken.dart';
import 'package:untitled/shared/styles/social_logo_icons.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<SocialCubit , SocialStates>(
          listener: (context, state) {
            if(state is SocialAddNewPostStates){
              navigatorTo(context, NewPostScreen());
            }
          },
          builder: (context, state) {

            var cubit = SocialCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title: Text(cubit.titels[cubit.currentIndex]),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification)),
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Search)),
                ],
              ),
              body:cubit.screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.ChangeBottomNav(index);
                    },
                  items: [
                    BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'home'),
                    BottomNavigationBarItem(icon: Icon(IconBroken.Chat),label: 'chats',),
                    BottomNavigationBarItem(
                        icon: CircleAvatar(radius: 23 , backgroundColor: Colors.lightBlue,
                            child: Icon(IconBroken.Add_User,
                              color: Colors.black,)),tooltip: 'Add Post',label: 'Add Post'),
                    BottomNavigationBarItem(icon: Icon(IconBroken.User),label: 'users'),
                    BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: 'settings'),
                    //cubit.BottomItem[cubit.currentIndex]
                  ]),
            );
          },
        );

  }
}
