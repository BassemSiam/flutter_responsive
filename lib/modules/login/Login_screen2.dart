import 'package:flutter/material.dart';

class login_screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         actions: [],


      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Login" ,
              style:
              TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20 ,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value){
                print(value);
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                prefixIcon: Icon(
                  Icons.email
                ),
                border: OutlineInputBorder()

              ),

            ),
            SizedBox(
              height: 20 ,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onFieldSubmitted: (value){
                print(value);
              },
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(
                      Icons.lock
                  ),
                  suffixIcon: Icon(
                      Icons.remove_red_eye_rounded),
                  border: OutlineInputBorder()

              ),

            ),
            SizedBox(
              height: 20 ,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: MaterialButton(onPressed: (){},
                color: Colors.blue,
                child: Text(
                  "LOGIN" ,
                  style: TextStyle(
                    color: Colors.white
                  ) ,
                ),

              ),
            )







          ],


        ),
      ),

    );
  }
}
