import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/modules/bmi_app/bmi_result/BMI_Result_screen.dart';

class BMI_Caculator extends StatefulWidget {

  @override
  State<BMI_Caculator> createState() => _BMI_CaculatorState();
}


class _BMI_CaculatorState extends State<BMI_Caculator> {
  bool isMale = true;
  double height = 120;
  int age = 20;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Caculator"
        ),
      ),
      body: Column(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;

                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male.png'),
                              height: 90,
                              width: 90,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: isMale ? Colors.blue : Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              height: 90,
                              width: 90,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: isMale ? Colors.black : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), // the first


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                   "HEIGHT" ,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic ,
                      children: [
                        Text("${height.round()}"
                        ,style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 25
                          ),),
                        Text("CM",
                        style: TextStyle(
                        color: Colors.white,

                        ),),

                      ],
                    ),
                    Slider(

                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (value) {
                        setState(() {
                        height=value;
                        });

                      },
                    ),
                  ],
          ),
              ),
            ),
          ),// the second


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${weight}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight ++;
                                  });

                                },
                                mini: true,
                                child: Icon(
                                    Icons.add
                                ),),
                              SizedBox(width: 50,),
                              FloatingActionButton(

                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });

                                },
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "${age}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });

                                },
                                mini: true,
                              child: Icon(
                                Icons.add
                              ),),
                              SizedBox(width: 50,),
                              FloatingActionButton(

                                onPressed: (){
                                  setState(() {

                                  });age--;

                                },
                                  mini: true,
                                child: Icon(
                                    Icons.remove
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),// the third


          Container (
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: MaterialButton
            ( onPressed: (){
              double result = weight / pow(height/100, 2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => BMI_Result(
                age: age,
                isMale: isMale,
                result: result.round(),
              ),
              ),
              );
            } ,
            child: Text(
             "CACULAT",
              style: TextStyle(
                color: Colors.white
              ),

            ),
          )
          )// the button
        ],
      ),




    );
  }
}
