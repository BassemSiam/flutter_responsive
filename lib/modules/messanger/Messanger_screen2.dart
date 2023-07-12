import 'package:flutter/material.dart';

class Messanger_screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpsV90xxH9vuGqFIixSqlHM504AEuE09GO1w&usqp=CAU"),


            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Chats" ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),

          ],
        ),
        actions: [
          IconButton( icon: CircleAvatar(
            radius: 20,
            child: Icon(
              size: 18,
              color: Colors.white,
              Icons.camera_alt
            ),
          ),onPressed: (){}),
          IconButton( icon: CircleAvatar(
            radius: 20,
            child: Icon(
                size: 18,
                color: Colors.white,
                Icons.edit
            ),
          ),onPressed: (){})

        ],
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[300]
              ),
              child: Row(
              children: [
                Icon(
                  Icons.search
                ),
                SizedBox( width: 15
                ),
                Text(
                    "Search"),
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItems(),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: 5,
                ),
              ],
            )
            ),
          )
        ],


      ),




    );
  }
}

Widget buildChatItems() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage("https://www.transfermarkt.com/mohamed-salah/profil/spieler/148455"),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3
          ),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 10,),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bassem Mohamd Saber Mohamed Siam Bassem Mohamd Saber Mohamed  Bassem Mohamd Saber Mohamed Siam",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,

            ),
          ),
          SizedBox(
            height: 8,),

          Row(


            children: [

              Expanded(
                  child:
                  Text(
                    "Hello im here where are you",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                ),
              ),
              Text("2:00 PM")
            ],
          )
        ],
      ),
    )


  ],


);
Widget buildStoryItems() => Container(
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("https://www.transfermarkt.com/mohamed-salah/profil/spieler/148455"),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3
            ),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      Container(
        width: 60,
        child: Text(
          "Bassem Mohamed Saber Siam",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),


    ],
  ),
);