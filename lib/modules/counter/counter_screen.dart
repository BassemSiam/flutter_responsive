
import 'package:flutter/material.dart';
import 'package:untitled/modules/login/login_screen.dart';

class CounterScreen extends StatefulWidget {

  @override
  State<CounterScreen> createState() => _CounterScreenState();


}


class _CounterScreenState extends State<CounterScreen> {



  int Counter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),

      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextButton(onPressed: (){
              setState(() {
                Counter--;
              });


            },
                child: Text("MINUS")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.red,
                child:
                Text(
                    "$Counter",
                  style:TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ) ,
                ),
              ),
            ),
            TextButton(onPressed: (){
              setState(() {
                Counter++;
                print(Counter);

              });
            },
                child: Text("PLUSE")),

          ],
        ),
      ),

    );
  }
}
