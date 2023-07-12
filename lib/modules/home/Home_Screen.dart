import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
          ),
          title: Text("First App"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit_notifications_sharp,
              ),
              onPressed: onNotifaction,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("okay you pressed on add");
              },
            ),
          ],

          elevation: 0.5,
          backgroundColor: Colors.teal,
        ),
        body:Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://wallpaperaccess.com/amazing-flowers"
                      ),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      width: 200,
                      padding: EdgeInsets.symmetric(
                          vertical: 10

                      ),
                      child: Text(
                        "Flowers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],



        )

    );
  }

  void onNotifaction() {
    print("you clicked on button ");
  }
}
