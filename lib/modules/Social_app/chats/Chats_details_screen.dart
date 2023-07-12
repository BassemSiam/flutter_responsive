import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Social_app/cubit/states.dart';
import 'package:untitled/models/Social_app_model/Chat_Model.dart';
import 'package:untitled/models/Social_app_model/Social_User_model.dart';
import 'package:untitled/shared/styles/icons_broken.dart';

class ChatDetailsScreen extends StatelessWidget {

  SocialUserModel userModel;
  ChatDetailsScreen(this.userModel);
  var SendMassageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).
        GetMessage(receiverId: userModel.uId!);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return  Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title:Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userModel.image!),
                    ),
                    SizedBox(width: 15,),
                    Text(userModel.name!),

                  ],
                ) ,
              ),
              body: ConditionalBuilder(
                condition: SocialCubit.get(context).Message.length>0,
                fallback: (context) {
                  return Center(child: CircularProgressIndicator());
                },
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [

                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                if(SocialCubit.get(context).socialUserModel!.uId==SocialCubit.get(context).Message[index].senderId)
                                  return SendMessage(SocialCubit.get(context).Message[index]);

                                return ReceiverMessage(SocialCubit.get(context).Message[index]);


                              },
                              separatorBuilder: (context, index) => SizedBox(height: 12,),
                              itemCount: SocialCubit.get(context).Message.length),
                        ),

                        Row(
                          children: [
                            MaterialButton(
                              padding: EdgeInsets.zero,
                              height: 1,
                              minWidth: 1,
                              child: Icon(Icons.add,color: Colors.blue,size: 35),
                              onPressed: (){

                              }, ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: TextFormField(
                                    controller: SendMassageController ,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type your Massage here ...'
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,),
                            CircleAvatar(
                              backgroundColor: Colors.blue[400],
                              child: MaterialButton(
                                minWidth: 1,
                                child: Icon(IconBroken.Send,color: Colors.white,),
                                onPressed: (){
                                  SocialCubit.get(context).
                                  SendMessage(
                                      receiverId: userModel.uId!,
                                      dateTime: DateTime.now().toString(),
                                      text: SendMassageController.text);
                                  SendMassageController.text = '';

                                }, ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );

  }





  Widget ReceiverMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.topStart,
    child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15
        ),
        decoration:  BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd:Radius.circular(10),
                topEnd: Radius.circular(10),
                topStart: Radius.circular(10))
        ),
        child: Text(model.text!
        )),
  );
  Widget SendMessage(MessageModel model)     => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15
        ),
        decoration:  BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadiusDirectional.only(
                bottomStart:Radius.circular(10),
                topEnd: Radius.circular(10),
                topStart: Radius.circular(10))
        ),
        child: Text(model.text!
        )),
  );
}
