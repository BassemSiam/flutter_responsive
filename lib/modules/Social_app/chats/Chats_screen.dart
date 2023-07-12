import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/models/Social_app_model/Add_post_model.dart';
import 'package:untitled/modules/Social_app/chats/Chats_details_screen.dart';
import 'package:untitled/shared/components/components.dart';

class Chats_screen extends StatelessWidget {
  const Chats_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var UserModel = SocialCubit.get(context).socialUserModel;
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ConditionalBuilder(
            condition: SocialCubit.get(context).Users.length >0,
            builder: (context) {
              return  ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        navigatorTo(context, ChatDetailsScreen(SocialCubit.get(context).Users[index]));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(SocialCubit.get(context).Users[index].image!),
                          ),
                          SizedBox(width: 15,),
                          Text(SocialCubit.get(context).Users[index].name!,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: SocialCubit.get(context).Users.length);
            },
            fallback: (context) => CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
