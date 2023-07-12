import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/layout/News_app/Cubit/cubit.dart';
import 'package:untitled/layout/News_app/News_layout.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Shop_layout.dart';
import 'package:untitled/layout/Social_app/cubit/cubit.dart';
import 'package:untitled/layout/Todo_app/Todo_layout.dart';
import 'package:untitled/modules/Country/chooseCountry.dart';
import 'package:untitled/modules/Native_code.dart';
import 'package:untitled/modules/Shop_app/Login/Shop_login_screen.dart';
import 'package:untitled/modules/Shop_app/Login/Cubit/cubit.dart';
import 'package:untitled/modules/Shop_app/On_boarding/on_boarding_screen.dart';
import 'package:untitled/modules/Social_app/Social_login/Social_login_screen.dart';
import 'package:untitled/modules/counter/counter_screen2.dart';
import 'package:untitled/modules/home/Home_Screen.dart';
import 'package:untitled/modules/messanger/Massnger_screen.dart';
import 'package:untitled/modules/messanger/Messanger_screen2.dart';
import 'package:untitled/modules/counter/counter_screen.dart';
import 'package:untitled/modules/login/login_screen.dart';
import 'package:untitled/modules/login/login_screen2.dart';
import 'package:untitled/modules/users/users_screen.dart';
import 'package:untitled/shared/block_observer.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/styles/themes.dart';
import 'layout/Social_app/Social_layout.dart';
import 'modules/home/Home_Screen2.dart';
import 'modules/login/Login_screen2.dart';
import 'shared/components/constants.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient (SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('on background running  ');
//   print(message.data.toString());
//   ShowToast(Text: 'on background Messages', state: ToastStates.SUCCESS);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,);
  // var tokenMessage = await FirebaseMessaging.instance.getToken();
  // print(tokenMessage);
  //
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  //
  //   ShowToast(Text: 'on Messages', state: ToastStates.SUCCESS);
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print(event.data.toString());
  //
  //   ShowToast(Text: 'on Messages open', state: ToastStates.SUCCESS);
  // });
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper();

  var IsDark = await CacheHelper.GetBoolean(key: 'IsDark');
  Widget widget;
  // var onBoarding = await CacheHelper.GetData(key: 'onBoarding');
  //token = await CacheHelper.GetData(key: 'token');
  uId = await CacheHelper.GetData(key: 'uId');
  print(uId);

//   if (onBoarding != true)
//   {
//     if (token != true) widget = ShopLayout();
//     else widget = ShopLoginScreen();
//   } else
//     {
//     widget = OnBoardingScreen();
// }

  if (uId != null)
  {
    widget = SocialLayout();
  } else
  {
    widget = SocialLoginScreen();
  }


  HttpOverrides.global= MyHttpOverrides();
  runApp(MyApp(widget,IsDark ));


}

class MyApp extends StatelessWidget {

  final Widget StartWedgit;
  final dynamic IsDark;


  MyApp(this.StartWedgit,this.IsDark);


  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSport()..getScience(),),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(FromShared: true),),
        BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..GetProfileData()),
        BlocProvider(create: (BuildContext context) => SocialCubit()..GetUserData()..GetPosts()),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context, state) =>
          MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: LightTheme,
          darkTheme: DarkTheme,
          themeMode: AppCubit.get(context).IsDark ? ThemeMode.light :ThemeMode.dark ,
          home: NativeScreenCode()
        ),
      ),
    );
  }

}