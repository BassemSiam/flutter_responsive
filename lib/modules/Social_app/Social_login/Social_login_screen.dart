import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Social_app/Social_layout.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/modules/Social_app/Social_Register/Social_register_screen.dart';
import 'package:untitled/modules/Social_app/Social_Register/cubit/cubit.dart';
import 'package:untitled/modules/Social_app/Social_login/Cubit/cubit.dart';
import 'package:untitled/modules/Social_app/Social_login/Cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';


class SocialLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit , SocialLoginState>(
        listener: (context, state) {
          if(state is SocialLoginErrorState){
            ShowToast(Text: state.error, state: ToastStates.ERROR);
          }
          if (state is SocialLoginSuccessState){
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navigateAndFinish(context, SocialLayout());
            });
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
                        Center(child: Image(image: AssetImage('assets/images/Login_chat.jpg'),fit: BoxFit.cover ,)),
                        SizedBox(height: 20,),
                        Text('Welcome Back ',
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
                          obscureText: SocialLoginCubit.get(context).IsShow,
                          onFieldSubmitted: (value){
                            if (formKey.currentState!.validate()){
                              SocialLoginCubit.get(context).
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
                                SocialLoginCubit.get(context).ChangePasswordVisabilty();
                              },
                              icon: Icon(SocialLoginCubit.get(context).SufixIcon),

                            ),

                          ),
                        ),
                        SizedBox(height: 15,),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
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
                                    SocialLoginCubit.get(context).
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
                                navigatorTo(context, SocialRegisterScreen());
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
