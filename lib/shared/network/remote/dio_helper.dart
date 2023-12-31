import 'package:dio/dio.dart';
class DioHelper
{

  // url for news_App >> 'https://newsapi.org/'
  // url for shop_App >> 'https://student.valuxapps.com/api/'
  static final dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,

      )
  );


  static Future<Response> getData({
  required String url,
    dynamic query,
    String lang = 'en',
    String? token,
}) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio.get(url , queryParameters: query,);
  }



  static Future<Response> PostData({
    required String url,
    required Map<String,dynamic> data,
     dynamic query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return dio.post(url ,data: data,queryParameters: query);
  }


  static Future<Response> PutData({
    required String url,
    required Map<String,dynamic> data,
    dynamic query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return dio.put(url ,data: data,queryParameters: query);
  }
}
