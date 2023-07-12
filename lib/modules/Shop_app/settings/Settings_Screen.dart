import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';
import 'package:untitled/modules/Shop_app/Login/Shop_login_screen.dart';
import 'package:untitled/modules/Shop_app/search/cubit/cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class SettingsScreen extends StatelessWidget {

  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var PhoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    NameController.text =  ShopCubit.get(context).getProfile!.data!.name;
    EmailController.text = ShopCubit.get(context).getProfile!.data!.email;
    PhoneController.text = ShopCubit.get(context).getProfile!.data!.phone;

    var CurrentController = TextEditingController();
    var NewController = TextEditingController();

    var FormKey = GlobalKey<FormState>();
    var ScafoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              if (state is ShopLoadingUpdateProfileState)
              LinearProgressIndicator(),
              SizedBox(height: 20,),
              TextFormField(
                controller: NameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal,width: 3),
                  borderRadius: BorderRadius.circular(50)),
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: EmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal,width: 3),
                        borderRadius: BorderRadius.circular(50)
                    ),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: PhoneController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal,width: 3),
                        borderRadius: BorderRadius.circular(50)),
                  label: Text('Phone'),
                  prefixIcon: Icon(Icons.phone)),
              ),
              SizedBox(height: 30,),
              TextButton(
                  onPressed: (){
                    ShopCubit.get(context).UpdateProfile(
                     name: NameController.text, email: EmailController.text, phone: PhoneController.text);
                    if(ShopCubit.get(context).getProfile!.status)
                    ShowToast(Text: ShopCubit.get(context).getProfile!.message, state: ToastStates.SUCCESS);
                    if(!ShopCubit.get(context).getProfile!.status)
                      ShowToast(Text: ShopCubit.get(context).getProfile!.message, state: ToastStates.ERROR);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Text('UPDATE',textAlign: TextAlign.center ,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  )),
              SizedBox(height: 20,),
              Spacer(),
              Form(
                key: FormKey,
                child: Row(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          alignment: AlignmentDirectional.topStart,
                          animationDuration: Duration(seconds: 5),
                        ),
                        onPressed: (){
                          showBottomSheet(context: context,
                            constraints: BoxConstraints.tight(Size.fromHeight(300)),
                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            backgroundColor: Colors.white,
                            elevation: 23,

                            builder:(context) => Container(
                              padding: EdgeInsetsDirectional.all(30),
                              child: Column(
                                children: [
                                  TextFormField(
                                      decoration: InputDecoration(
                                    helperText: 'current Password',
                                  ),
                                    controller: CurrentController,
                                  ),
                                  TextFormField(decoration: InputDecoration(
                                    helperText: 'New Password',
                                  ) , controller: NewController),
                                  Spacer(),
                                  Row(
                                    children: [
                                      TextButton(onPressed: (){
                                        ShopCubit.get(context).ChangePassword(
                                        Current: CurrentController.text, New:NewController.text);

                                        if(ShopCubit.get(context).ChangePass!.status){
                                          Navigator.pop(context);
                                          ShowToast(Text: ShopCubit.get(context).ChangePass!.message, state: ToastStates.SUCCESS);

                                        }else
                                          ShowToast(Text: ShopCubit.get(context).ChangePass!.message, state: ToastStates.ERROR);
                                      }, child:
                                      Container(
                                        color: Colors.grey[350],
                                          child: Text('Change' ,  style: TextStyle(color: Colors.black , fontSize: 24))) ,

                                      ),
                                      Spacer(),
                                      FloatingActionButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child:Icon(Icons.forward), mini: true , backgroundColor: Colors.grey[300]  ),
                                    ],
                                  ),

                                ],),
                            ) ,
                          ).close;
                        },
                        child: Text('Change Password'
                          ,textAlign: TextAlign.center ,style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.grey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),)),
                    Spacer(),
                    FloatingActionButton(
                        tooltip: 'LOGOUT',
                        onPressed: (){
                        showDialog(context: context,
                        builder: (context) => AlertDialog(
                                title: Text('Logout'),
                                content: Text('Do you want to log out ? '),
                                actions: [
                                  TextButton(child: Text('Yes'), onPressed: (){
                                    CacheHelper.RemoveData(key: 'token');
                                    navigateAndFinish(context, ShopLoginScreen());
                                  } ),
                                  TextButton(child: Text('No') , onPressed: (){
                                    Navigator.pop(context);
                                  }, ),

                                ],

                              ));
                          },
                        child: Icon(Icons.logout)),
                  ],
                ),
              ),


            ],
          ),

        );

      },
    );
  }
}
