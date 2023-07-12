import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/icons_broken.dart';

class EditProfileScreen extends StatelessWidget {

  var EditNameController = TextEditingController();
  var EditBioController = TextEditingController();
  var EditPhoneController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit , SocialStates>(
     listener: (context, state) {

     },
      builder: (context, state) {
        var UserModel = SocialCubit.get(context).socialUserModel;
        var ProfileImage = SocialCubit.get(context).ProfileImage;
        var CoverImage = SocialCubit.get(context).CoverImage;

        EditNameController.text = UserModel!.name!;
        print((UserModel.name!));
        EditBioController.text = UserModel.bio!;
        EditPhoneController.text = UserModel.phone!;

        if(ProfileImage == null){
          ProfileImage=NetworkImage(UserModel.image!) ;
        }else{
          ProfileImage = FileImage(ProfileImage) ;
        }


        if(CoverImage == null){
          CoverImage=AssetImage('assets/images/img.png') ;
        }else{
          CoverImage = FileImage(CoverImage) ;
        }

        return Scaffold(
          appBar: AppBar(
            titleSpacing: 4.0,
            leading: IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                icon: Icon(IconBroken.Arrow___Left_2)),
            title: Text('Edit profile'),
            actions: [
              TextButton(
                  onPressed: (){
                    SocialCubit.get(context).
                    UpdateUserData(name: EditNameController.text,
                                   phone: EditPhoneController.text,
                                   bio: EditBioController.text);
                  },
                  child: Text('Update')),
              SizedBox(width: 10,)
            ],
          ),
          body: Column(
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
                          )
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer ,
                                child: Image(image:CoverImage ,
                                  height: 180,width: double.infinity,fit: BoxFit.cover,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50,right: 8),
                            child: CircleAvatar(
                            child: IconButton(
                                onPressed: (){
                              SocialCubit.get(context).getCoverImage();
                            }, icon:Icon(IconBroken.Camera) )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: ProfileImage ,
                            ),
                            CircleAvatar(radius:20 ,
                            child: IconButton(onPressed: (){
                              SocialCubit.get(context).getProfileImage();
                            }, icon:Icon(IconBroken.Camera,) )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if(SocialCubit.get(context).ProfileImage != null||SocialCubit.get(context).CoverImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  if(SocialCubit.get(context).ProfileImage !=null )
                  Expanded(child: defultButton(function:(){
                    SocialCubit.get(context).UploadProfileImage(
                    name: EditNameController.text,
                    phone: EditPhoneController.text,
                    bio: EditBioController.text
                    );
                  } ,text: 'Update Profile')),
                  SizedBox(width: 5,),
                  if(SocialCubit.get(context).CoverImage != null)
                  Expanded(child: defultButton(function:(){
                    SocialCubit.get(context).UploadCoverImage(
                        name: EditNameController.text,
                        phone: EditPhoneController.text,
                        bio: EditBioController.text
                    );
                  } ,text: 'Update Cover')),
                  SizedBox(height: 20,),
                ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: EditNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                     borderSide: BorderSide(style: BorderStyle.solid)
                    ),
                    label: Text('Name'),
                    prefixIcon: Icon(IconBroken.User1),


                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: defulteFormFiled(
                  controller: EditBioController,label: 'Bio', prefix: IconBroken.Edit,),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: defulteFormFiled(label: 'phone', prefix: IconBroken.Call,controller: EditPhoneController, ),
              ),
            ],
          ),
        );
      },
    );
  }
}
