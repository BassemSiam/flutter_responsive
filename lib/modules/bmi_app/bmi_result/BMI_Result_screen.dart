import 'package:flutter/material.dart';

class BMI_Result extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  BMI_Result({
    required this.result,
    required this.isMale,
    required this.age});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);

        }, icon: Icon(Icons.arrow_left
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(
              'Result : ${result}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(
              'Age : ${age}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      ),

    );
  }
}
