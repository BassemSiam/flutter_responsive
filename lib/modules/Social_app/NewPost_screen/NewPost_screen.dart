import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/shared/styles/icons_broken.dart';

class NewPostScreen extends StatelessWidget {

var TextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit , SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: ()
            {Navigator.pop(context);}, icon: Icon(IconBroken.Arrow___Left_2)),
            title: Text('Create post'),
            actions: [
              TextButton(onPressed: (){
              if(SocialCubit.get(context).PostImage == null){
              SocialCubit.get(context).CreatePost(dateTime: DateTime.now().toString(), Text: TextController.text);
              }else{
                SocialCubit.get(context).UploadPost(dateTime: DateTime.now().toString(), Text: TextController.text);
              }

              }, child: Text('Post'))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    if(state is SocialCreatePostLoadingStates)
                    LinearProgressIndicator(),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://www.muhtwa.com/wp-content/uploads/Screenshot_2017-03-11-23-42-30-1.png'),
                    ),
                    SizedBox(width: 15,),
                    Expanded(child: Text('Bassem Siam',style: TextStyle(fontWeight: FontWeight.bold)),

                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: TextController,
                    decoration: InputDecoration(
                      hintText: 'what in your maind...',
                      border: InputBorder.none,
                    ),

                  ),
                ),
                if(SocialCubit.get(context).PostImage != null)
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
                              )
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer ,
                                    child: Image(image: FileImage(SocialCubit.get(context).PostImage) ,
                                      height: 180,width: double.infinity,fit: BoxFit.cover,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50,right: 8),
                                child: CircleAvatar(
                                    child: IconButton(
                                        onPressed: (){
                                          SocialCubit.get(context).removePostImage();
                                        }, icon:Icon(Icons.close) )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(onPressed: (){
                        SocialCubit.get(context).getPostImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(IconBroken.Image),
                          SizedBox(width:3,),
                          Text('Add photo')
                        ],
                      )),
                    ),
                    Expanded(
                      child: TextButton(onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('# Tags')
                        ],
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
