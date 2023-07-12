import 'package:flutter/material.dart';
import 'package:untitled/models/user_model.dart';



class UsersScreen extends StatelessWidget{
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: "John",
      phone: 0111111141,
    ),
    UserModel(
      id: 2,
      name: "bassem",
      phone: 1010101010,
    ),
    UserModel(
      id: 3,
      name: "toqa",
      phone: 0122222058,
    ),
    UserModel(
      id: 4,
      name: "mohamed",
      phone: 0114785214,
    ),
    UserModel(
      id: 5,
      name: "safsd",
      phone: 01024899327,
    ),
    UserModel(
      id: 5,
      name: "ahmed",
      phone: 01005699327,
    ),
    UserModel(
      id: 1,
      name: "John",
      phone: 0111111141,
    ),
    UserModel(
      id: 2,
      name: "bassem",
      phone: 1010101010,
    ),
    UserModel(
      id: 3,
      name: "toqa",
      phone: 0122222058,
    ),
    UserModel(
      id: 4,
      name: "mohamed",
      phone: 0114785214,
    ),
    UserModel(
      id: 5,
      name: "safsd",
      phone: 01024899327,
    ),
    UserModel(
      id: 5,
      name: "ahmed",
      phone: 01005699327,
    ),




  ];


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Users"),
     ),
     body: Padding(
       padding: const EdgeInsets.all(10.0),
       child:ListView.separated(
           itemBuilder: (context, index) => BuildUserItems(users[index]),
           separatorBuilder: (context, index) => Container(
             width: double.infinity,
             height: 2,
             color: Colors.grey[300],
           ),
           itemCount: users.length) ,
     ),


   );
  }
  Widget BuildUserItems(UserModel users) => Row(
    children: [

      CircleAvatar(
        radius: 20,
        child: Text(
            "${users.id}"
          ,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(""
              "${users.name}"
            ,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
          Text("${users.phone}",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey
            ),
          )


        ],
      )


    ],



  );

}