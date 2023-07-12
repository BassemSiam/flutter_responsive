import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/models/Social_app_model/Add_post_model.dart';
import 'package:untitled/models/Social_app_model/Chat_Model.dart';
import 'package:untitled/models/Social_app_model/Social_User_model.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/modules/Social_app/NewPost_screen/NewPost_screen.dart';
import 'package:untitled/modules/Social_app/chats/Chats_screen.dart';
import 'package:untitled/modules/Social_app/feeds/Feeds_screen.dart';
import 'package:untitled/modules/Social_app/settings/Settings_screen.dart';
import 'package:untitled/modules/Social_app/users/Users_screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {

  SocialCubit() :super (SocialInitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);


  SocialUserModel? socialUserModel;
  int currentIndex = 0;
  // var changeText ;

  List<Widget> screen = [
    Feeds_screen(),
    Chats_screen(),
    NewPostScreen(),
    Users_screen(),
    Settings_screen(),

  ];
  List<String> titels = [
    'Home',
    'Chats',
    'New Post',
    'Users',
    'Settings',
  ];
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chats'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined), label: 'Add Post'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'users'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
  ];

  // void ShowSendBottom({required String changeText}){
  //   if(changeText.length>0){
  //   changeText = '';
  //   emit(state);
  //   }
  //
  // }
  void ChangeBottomNav(index) {
    if(index == 1){
      GetAllUser();
    }
    if (index == 2) {
      emit(SocialAddNewPostStates());
    } else
      currentIndex = index;
    emit(SocialChangeBottomNavStates());
  }


  void GetUserData() {
    emit(SocialGetUserLoadingStates());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      socialUserModel = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessStates());
    }).catchError((error) {
      emit(SocialGetUserErrorStates(error.toString()));
      print(error.toString());
    });
  }


  //////////// Get and pick imageProfile and coverProfile ////////////////
  var ProfileImage;
  var picker = ImagePicker();

  Future getProfileImage() async {
    var PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      ProfileImage = File(PickedFile.path);
      emit(SocialImagePickedProfileSuccessStates());
    } else {
      print('no image selected');
      emit(SocialImagePickedProfileErrorStates());
    }
  }

  var CoverImage;

  Future getCoverImage() async {
    var PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      CoverImage = File(PickedFile.path);
      emit(SocialImagePickedCoverSuccessStates());
    } else {
      print('no image selected');
      emit(SocialImagePickedCoverErrorStates());
    }
  }


  ////////////Uploading imageProfile and coverProfile////////////////

  void UploadProfileImage({required String name,
    required String phone,
    required String bio,}) {
    firebase_storage.FirebaseStorage.instance.ref().
    child('users/${Uri
        .file(ProfileImage.path)
        .pathSegments
        .last}').putFile(ProfileImage).then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadImageProfileSuccessStates());
        print(value);
        UpdateUserData(name: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(SocialUploadImageProfileErrorStates());
      });
    }).catchError((eError) {
      SocialUploadImageProfileErrorStates();
    });
  }


  void UploadCoverImage({required String name,
    required String phone,
    required String bio,}) {
    firebase_storage.FirebaseStorage.instance.
    ref().
    child('users/${Uri
        .file(CoverImage.path)
        .pathSegments
        .last}').putFile(CoverImage).then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadImageCoverSuccessStates());
        print(value);
        UpdateUserData(name: name, phone: phone, bio: bio, cover: value);
      }).catchError((error) {
        emit(SocialUploadImageCoverErrorStates());
      });
    }).catchError((eError) {
      SocialUploadImageCoverErrorStates();
    });
  }


  // update data for user//

  void UpdateUserData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    SocialUserModel UserModel =
        SocialUserModel(
        name,
        socialUserModel!.email,
        phone,
        uId,
        image ?? socialUserModel!.image,
        cover ?? socialUserModel!.cover,
        bio,
        false);
    FirebaseFirestore.instance.collection('users').
    doc(socialUserModel!.uId).
    update(UserModel.toJson()).then((value) {
    GetUserData();
    }).catchError((error) {
    });
  }

  var PostImage;

  Future getPostImage() async {
    var PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      PostImage = File(PickedFile.path);
      emit(SocialImagePickedPostSuccessStates());
    } else {
      print('no image selected');
      emit(SocialImagePickedPostErrorStates());
    }
  }


  void removePostImage() {
    PostImage = null;
    emit(SocialRemovePostImageStates());
  }


  void UploadPost({
    required String dateTime,
    required String Text,
  })
  {
    emit(SocialCreatePostLoadingStates());
    firebase_storage.FirebaseStorage.instance.
         ref().
         child('Posts/${Uri.file(PostImage.path).pathSegments.last}')
        .putFile(PostImage).then((value) {
         value.ref.getDownloadURL().then((value) {
           print(value);
           CreatePost(
               dateTime: dateTime,
               Text: Text,
               PostImage: value);

         }).catchError((error){
           emit(SocialCreatePostErrorStates());
         });
    }).catchError((error){

    });

  }



  void CreatePost({
    required String dateTime,
    required String Text,
    String? PostImage,
  }) {
    PostModel postModel =
    PostModel(
      socialUserModel!.name,
      dateTime,
      Text,
      socialUserModel!.uId,
      socialUserModel!.image,
      PostImage
        );
    FirebaseFirestore.instance.collection('Posts').
    add(postModel.toJson()).then((value) {
      emit(SocialCreatePostSuccessStates());
    }).catchError((error) {
      emit(SocialCreatePostErrorStates());

    });
  }


  List <PostModel> posts = [];
  List <String> postsId = [];
  List <int> Likes = [];
  void GetPosts(){
    FirebaseFirestore.instance.
    collection('Posts').
    get().
    then((value) {
    value.docs.forEach((element) {
      element.reference.
      collection('Likes').
      get().
      then((value) {
       Likes.add(value.docs.length);
       posts.add(PostModel.fromJson(element.data()));
       postsId.add(element.id);
      }).catchError((error){

      });

    });
    emit(SocialGetPostsSuccessStates());
    }).catchError((error){
    emit(SocialGetPostsErrorStates(error));
    });
}




  void likePost(String PostId){
    FirebaseFirestore.instance.
    collection('Posts').
    doc(PostId).
    collection('Likes').
    doc(socialUserModel!.uId).
    set({'Like':true}).
    then((value){
     emit(SocialLikePostsSuccessStates());
    }).catchError((error){
      emit(SocialLikePostsErrorStates(error));
    });

  }

  List<SocialUserModel> Users = [];
  void GetAllUser(){
    if(Users.length == 0)
    FirebaseFirestore.instance.collection('users').get().then((value) {
    value.docs.forEach((element) {
    if(element.data()['uId'] != socialUserModel!.uId)
    Users.add(SocialUserModel.fromJson(element.data()));
    emit(SocialGetAllUserSuccessStates());
    });
  }).catchError((error){
    emit(SocialGetAllUserErrorStates(error));
  });
  }


  void SendMessage({
  required String receiverId,
  required String dateTime,
  required String text,})
  {
     MessageModel  messageModel =
     MessageModel(
         senderId: socialUserModel!.uId,
         receiverId: receiverId,
         dateTime: dateTime,
         text: text);

     // save message for me

     FirebaseFirestore.instance.
     collection('users').
     doc(socialUserModel!.uId).
     collection('chats').
     doc(receiverId).
     collection('Massages').
     add(messageModel.toJson()).then((value) {
       emit(SocialSendMessageSuccessStates());
     }).catchError((error){
       emit(SocialSendMessageErrorStates());
     });


     // save message for receiver

     FirebaseFirestore.instance.
     collection('users').
     doc(receiverId).
     collection('chats').
     doc(socialUserModel!.uId).
     collection('Massages').
     add(messageModel.toJson()).then((value) {

       emit(SocialSendMessageSuccessStates());
     }).catchError((error){
       emit(SocialSendMessageErrorStates());
     });
  }

  List <MessageModel> Message = [];
  void GetMessage({required String receiverId,}){

    FirebaseFirestore.instance.
    collection('users').
    doc(socialUserModel!.uId).
    collection('chats').
    doc(receiverId).
    collection('Massages').
    orderBy('dataTime').
    snapshots().
    listen((event) {
      Message = [];
    event.docs.forEach((element) {
    Message.add(MessageModel.fromJson(element.data()));
       });
    emit(SocialGetMessageSuccessStates());
    });
  }

}


