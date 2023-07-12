import 'package:shared_preferences/shared_preferences.dart';



 class CacheHelper {


      static Future<bool> PutBoolean({required String key, required bool value}) async {
       SharedPreferences prefs =  await SharedPreferences.getInstance();
       return await prefs.setBool(key, value);
     }

      static dynamic GetBoolean({required String key}) async{
        SharedPreferences prefs =  await SharedPreferences.getInstance();
       return prefs.get(key);

     }



                        //// just use this ////

      static Future<bool> saveData(
          {required String key,
        required dynamic  value})
      async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (value is String) return await prefs.setString(key, value);
        if (value is int) return await prefs.setInt(key, value);
        if (value is bool) return await prefs.setBool(key, value);
        return await prefs.setDouble(key, value);
      }


      static dynamic GetData({required String key}) async{
        SharedPreferences prefs =  await SharedPreferences.getInstance();
        return prefs.get(key);

      }
      static dynamic RemoveData({required String key}) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.remove(key);
      }

   }
