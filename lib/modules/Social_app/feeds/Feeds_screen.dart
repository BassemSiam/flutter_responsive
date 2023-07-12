import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/models/Social_app_model/Add_post_model.dart';
import 'package:untitled/models/Social_app_model/Social_User_model.dart';

class Feeds_screen extends StatelessWidget {
const Feeds_screen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return BlocConsumer<SocialCubit , SocialStates>(
    listener: (context, state) {
      },
    builder: (context, state) {
      return ConditionalBuilder(
        condition: SocialCubit.get(context).posts.length>0,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer ,
                          margin: EdgeInsets.all(8),
                          child: Image(image: AssetImage('assets/images/img.png'),
                            height: 230,width: double.infinity,fit: BoxFit.cover,)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('connect with your friends ',style: TextStyle(
                            fontWeight: FontWeight.bold , color: Colors.white70
                        ),),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: Colors.grey[300],),
                  itemBuilder:(context, index) => BulidPostItem(SocialCubit.get(context).posts[index],context,index,SocialCubit.get(context).socialUserModel!),
                  itemCount: SocialCubit.get(context).posts.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                ),
                SizedBox(
                  height: 8,),
              ],
            ),
          );
        },
        fallback:(context) => Center(child: CircularProgressIndicator()),
      );
    },
  );
}







Widget BulidPostItem (PostModel model ,context,index,SocialUserModel Socialmodel) => Card(
  margin: EdgeInsets.symmetric(horizontal: 8),
  elevation: 7,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(model.image!),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(model.name!,style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 2,),
                      Icon(Icons.check_circle,color: Colors.blue,size: 15,)
                    ],
                  ),
                  Text(model.dataTime!,style: Theme.of(context).textTheme.caption,)
                ],
              ),
            ),
            IconButton(onPressed: ()
            {

            },
                icon: Icon(Icons.more_horiz)),
          ],
        ),
        Divider(),
        Text(model.text!,
          style:TextStyle(
              fontWeight: FontWeight.w700,
              height: 1.2
          ) ,),
        Container(
          width: double.infinity,
          child: Wrap(

            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 6),
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  height: 30,
                  minWidth: 1.0,
                  child: Text('#Software',style: TextStyle(
                    color: Colors.blue,
                  ),),),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 6),
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  height: 30,
                  minWidth: 1.0,
                  child: Text('#flutter',style: TextStyle(
                    color: Colors.blue,
                  ),),),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 6),
                child: MaterialButton(
                  onPressed: (){},
                  padding: EdgeInsets.zero,
                  height: 30,
                  minWidth: 1.0,
                  child: Text('#software_devolpment',style: TextStyle(
                    color: Colors.blue,
                  ),),),
              ),

            ],
          ),
        ),
        SizedBox(height: 8,),

           if(model.postImage!=null)

         Card(
            clipBehavior: Clip.antiAliasWithSaveLayer ,
            margin: EdgeInsets.all(8),
            child: Image(image: NetworkImage(model.postImage!)
              ,width: double.infinity,fit: BoxFit.cover,)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.favorite_border,size: 16,color: Colors.red),
                    Text('${SocialCubit.get(context).Likes[index]}',style: Theme.of(context).textTheme.caption),
                  ],
                ),
                onTap: (){},
              ),
              Spacer(),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.chat_bubble_outline,size: 16,color: Colors.blue,),
                    SizedBox(width: 3,),
                    Text('0',style: Theme.of(context).textTheme.caption),
                    SizedBox(width: 2,),
                    Text('comments',style: Theme.of(context).textTheme.caption),

                  ],
                ),
                onTap: (){},
              ),
            ],
          ),
        ),
        SizedBox(height: 4,),
        Divider(color: Colors.grey[300],),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                  NetworkImage(Socialmodel.image!),
                ),
                SizedBox(width: 15,),
                Text('write a comment ...',
                    style: Theme.of(context).textTheme.caption),
                Spacer(),
                InkWell(
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border,size: 16,color: Colors.red),
                      SizedBox(width: 3,),
                      Text('Like',style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  onTap: (){
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                  },
                ),

              ]
          ),
        ),


      ],

    ),
  ),
);
}
