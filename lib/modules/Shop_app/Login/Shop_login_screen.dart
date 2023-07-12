import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/Shop_app/Shop_layout.dart';
import 'package:untitled/modules/Shop_app/Login/Cubit/cubit.dart';
import 'package:untitled/modules/Shop_app/Login/Cubit/states.dart';
import 'package:untitled/modules/Shop_app/Register/Shop_register_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var EmailController = TextEditingController();
    var PasswordController = TextEditingController();



    var formKey =GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState){
            if (state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(key: 'token',
                  value: state.loginModel.data!.token)
                  .then((value) {
                    token = state.loginModel.data!.token;
                    navigateAndFinish(context, ShopLayout());
              });
            } else {
              ShowToast(
                  Text: state.loginModel.message,
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4
                        ),
                        SizedBox(height: 20,),
                        Text('Login Now for Hot Offers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: EmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the email address';
                            }
                          },
                          onTap: () {


                          },
                          decoration: InputDecoration(
                            label: Text('email address'),
                            prefixIcon: Icon(Icons.email),
                          ),

                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: PasswordController,
                          keyboardType: TextInputType.text,
                          obscureText: ShopLoginCubit.get(context).IsShow,
                          onFieldSubmitted: (value){
                                   if (formKey.currentState!.validate()){
                            ShopLoginCubit.get(context).
                            userLogin(email: EmailController.text,
                            password: PasswordController.text);}
                                                  },

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          onTap: () {

                          },
                          decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                ShopLoginCubit.get(context).ChangePasswordVisabilty();
                              },
                              icon: Icon(ShopLoginCubit.get(context).SufixIcon),

                            ),

                          ),
                        ),
                        SizedBox(height: 15,),
                        ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) => Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal,
                              ),
                              child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()){
                                      ShopLoginCubit.get(context).
                                      userLogin(email: EmailController.text,
                                      password: PasswordController.text);
                                    } },
                                    child: Text('LOGIN',
                                     style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  )),
                            ),
                            fallback: (context) => Center(child: CircularProgressIndicator()),
                          ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t Have an account ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            TextButton(
                              onPressed: () {
                                navigatorTo(context, ShopRegisterScreen());
                              },
                              child: Text('Register now ',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  }
