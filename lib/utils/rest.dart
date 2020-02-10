import 'dart:convert';
import 'package:http/http.dart' as http;


class Rest{

    static Rest _instance = new Rest.internal();
    Rest.internal();
    factory Rest() => _instance;

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

  

}