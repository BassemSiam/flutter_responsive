import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Shop_layout.dart';
import 'package:untitled/modules/Shop_app/Login/Shop_login_screen.dart';
import 'package:untitled/modules/Shop_app/Register/cubit/cubit.dart';
import 'package:untitled/modules/Shop_app/Register/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();
    var EmailController = TextEditingController();
    var PasswordController = TextEditingController();
    var PhoneController = TextEditingController();

    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (ShopRegisterCubit.get(context).RegisterModel!.status) {
              ShowToast(Text: ShopRegisterCubit.get(context).RegisterModel!.message, state: ToastStates.SUCCESS);
              CacheHelper.saveData(
                  key: 'token',
                  value:ShopRegisterCubit.get(context).RegisterModel!.data!.token).then((value) {
                navigateAndFinish(context, ShopLayout());
              });;

              navigateAndFinish(context, ShopLoginScreen());
            } else {
              ShowToast(Text: ShopRegisterCubit
                  .get(context)
                  .RegisterModel!
                  .message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {


          return Scaffold(
            appBar:
            AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4
                        ),
                        SizedBox(height: 20,),
                        Text('Register Now....',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextFormField(
                          controller: NameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter User Name';
                            }
                          },
                          onTap: () {

                          },
                          decoration: InputDecoration(
                            label: Text('User Name'),
                            prefixIcon: Icon(Icons.person),
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: ShopRegisterCubit.get(context).IsShow,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';}
                          },
                          decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                ShopRegisterCubit.get(context).ChangePasswordVisabilty();
                              },
                              icon: Icon(ShopRegisterCubit.get(context).SufixIcon),

                            ),

                          ),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: PhoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Phone Number';
                            }
                          },
                          onTap: () {

                          },
                          decoration: InputDecoration(
                            label: Text('Phone Number'),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 15,),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
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
                                    ShopRegisterCubit.get(context).RegisterData(
                                        name: NameController.text ,
                                        phone: PhoneController.text,
                                        email: EmailController.text,
                                        password: PasswordController.text);
                                  } }, child: Text('Register',
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
