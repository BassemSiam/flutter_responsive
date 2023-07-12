import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/modules/home/Home_Screen.dart';
import 'package:untitled/shared/components/components.dart';

class ChooseCountry extends StatefulWidget {

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {

  savePref(String country ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('country', country);
    print(country);
  }

  getPref ()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getString('country');
  if(prefs != null){
    navigatorTo(context, HomeScreen());
  }
  }
  @override
  void initState() {
    getPref();
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('اختر البلد التى تسكم فيها '),),
        body:Container(
          child: ListView(children: [
            ListTile(title: Text('مصر'),onTap: (){
              savePref('Egypt');
            },),
            ListTile(title: Text('السعودية'),onTap: (){
              savePref('sadui');
            },),
            ListTile(title: Text('سوريا'),onTap: (){
              savePref('syria');
            },),
          ]),
        ) ),
      ),);
  }
}
