import 'package:flutter/material.dart';

class MassngerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){

            }, color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.camera_alt)
            ),
          ),
          SizedBox(
            width: 7,
          ),

          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){

            },color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.edit)),
          )

        ],
        title: Row(
          children: [

            CircleAvatar(
              radius: 15.5,
              backgroundImage: NetworkImage(""),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
                "Chats"
            ,style:TextStyle(
              color: Colors.black
            ),
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text("Search"),
                  ],

                ),
              ),
              SizedBox(
                height: 13,),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildStoryItems(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15,
                  ),

                ),
              ),
              SizedBox(
                height: 13,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context, index) => buildChatItems(),
                separatorBuilder: ((context, index) => SizedBox(height: 20,)),
                itemCount:15 ,)

            ],

          ),
        ),
      ),
    );
  }
}



// to make a listview
// 1 - build the items
// 2 - arrow function
// 3 - build list
// 4 -add items to the list
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