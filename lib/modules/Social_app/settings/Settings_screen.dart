import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/modules/Social_app/Edit_profile/Edit_profile_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/icons_broken.dart';

class Settings_screen extends StatelessWidget {
  const Settings_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var Model = SocialCubit.get(context).socialUserModel;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            image: AssetImage('assets/images/img.png'),
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${Model!.image}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${Model.name}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 24,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${Model.bio}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('post',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Text('Frindes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Text('Followers',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Text('Following',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('100',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      ),
                      Expanded(
                        child: Text('2.2 M',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      ),
                      Expanded(
                        child: Text('1.1 M',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      ),
                      Expanded(
                        child: Text('2',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Edit Post',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          navigatorTo(context, EditProfileScreen());
                        },
                        child: Icon(IconBroken.Edit),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          FirebaseMessaging.instance.subscribeToTopic('announcement');
                        },
                        child: Text('Subscibe '),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Unsubscibe'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
