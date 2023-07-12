import 'package:flutter/material.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/modules/users/users_screen.dart';


class User_screen2 extends StatelessWidget {

  List<UserModel> users = [
    UserModel(id: 1,
        name: "bassem",
        phone: 01145782228),
    UserModel(id: 2,
        name: "mohamed",
        phone: 0158982228),
    UserModel(id: 3,
        name: "siam",
        phone: 01041700289),
    UserModel(id: 4,
        name: "saber",
        phone: 01225789228),
    UserModel(id: 5,
        name: "dawoud",
        phone: 01545747828),
    UserModel(id: 6,
        name: "hassan",
        phone: 01060012479),
    UserModel(id: 1,
        name: "bassem",
        phone: 01145782228),
    UserModel(id: 2,
        name: "mohamed",
        phone: 0158982228),
    UserModel(id: 3,
        name: "siam",
        phone: 01041700289),
    UserModel(id: 4,
        name: "saber",
        phone: 01225789228),
    UserModel(id: 5,
        name: "dawoud",
        phone: 01545747828),
    UserModel(id: 6,
        name: "hassan",
        phone: 01060012479),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "user_screen"
        ),
      ),
      body: ListView.separated(
          itemBuilder:(context, index) => bulidUserItem(users [index]),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount:users.length,
      ),








    );
  }
}
Widget bulidUserItem(UserModel user)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 25,
        child: Text(
          '${user.id}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
      SizedBox(width: 20,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
          ),
          Text('${user.phone}',
            style: TextStyle(
                color: Colors.grey
            ),)
        ],
      )

    ],

  ),
);