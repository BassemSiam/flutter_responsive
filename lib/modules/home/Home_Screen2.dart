import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen2 extends StatelessWidget {
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
              onPressed: (){
                print("Hello!");
              },
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
        body: SingleChildScrollView(
          child: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(50.50),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20)
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image(
                        image:
                        NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBZhyu8-DpVgEkXtKmFqwF-ftluyHcHPbaCQ&usqp=CAU"
                          ),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5
                        ),
                        color: Colors.grey.withOpacity(0.5),
                        width: double.infinity,
                        child: Text(
                            "BMW",
                            textAlign:TextAlign.center ,
                          style: TextStyle(color: Colors.black ,
                             fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
      ),
        )
    );
  }
}
