import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class loginScreen extends StatefulWidget {

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emileController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey =GlobalKey<FormState>();

  bool PasswordShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.login
        ),
        title: Text(
            "login".toUpperCase()
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LOGIN",
                    style:  TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'the email address is empty';
                      }
                      return null;
                    },
                    controller: emileController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border:OutlineInputBorder() ,
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'the password is empty';
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: PasswordShow,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border:OutlineInputBorder() ,
                      suffixIcon: IconButton(
                        icon: Icon( PasswordShow ? Icons.visibility : Icons.visibility_off 
                        ), onPressed: () {
                          setState(() {
                            PasswordShow = !PasswordShow;
                          });


                      },
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () => {
                    if(formKey.currentState!.validate() ){
                      print(emileController.text) }
                    }
                    ,
                    child: Text(
                      "login",
                      style:  TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                  defultButton
                    (
                   width: double.infinity,
                   background: Colors.blue,
                   function: (){
                     if(formKey.currentState!.validate() ){
                       print(emileController.text);
                       print(passwordController.text);
                     }

                   },
                   text: "login" ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don't have an account ? ".toUpperCase(),

                      ),
                      TextButton(onPressed: (){

                      },
                          child: Text("Register Now"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
