import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:kampungku/utils/apppath.dart';


class Rest{

    static Rest _instance = new Rest.internal();
    static final Dio _dio = Dio();
    Rest.internal();
    factory Rest(){
      _dio.options..baseUrl = AppPath.host;
      return _instance;
    }
    final JsonDecoder _decoder = new JsonDecoder();

    Future<dynamic> getMethod(String url){
      return http.get(url).then((http.Response response){
        final String res = response.body;
        final int statusCode = response.statusCode;
        if(statusCode < 200 || statusCode > 400 || json == null){
          throw new Exception("Error while fetching data");
        }
        return _decoder.convert(res);
      });
    }

    Future<dynamic> getPost(Map data,String url) async {
      try {
        Response response = await _dio.post(
          url,
          data: data,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        return response.data;
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return null;
      }
    }


    Future<dynamic> formData(FormData form,String url,Function(int sent,int total) progres) async {
      try{
        Response response = await _dio.post(
          url,
          data: form,
          onSendProgress: progres
        );
        return response.data;
      }catch(error,stacktrace){
        print("Exception occured: $error stackTrace: $stacktrace");
        return null;
      }
    }


    Future<dynamic> get(String url) async {
      try {
        Response response = await _dio.get(url);
        return response.data;
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return null;
      }
    }




  

}