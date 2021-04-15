import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIConfig{

  static final _dio = Dio();
  // static final _headers = <String, String>{
  //   'Content-Type' : 'application/json',
  //   'X-Requested-With' : 'XMLHttpRequest',
  //   'Accept' : 'application/json',
  // };

  static Dio getClient([String? token]){
    /// not needed as backend does not require authorization
    /*if(token != null){
      _headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    _dio.options = BaseOptions(
        headers: _headers
    );

    if(env['serverType'] == 'local'){
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;};
    }*/

    return _dio;

  }

  static String getEndPoint(String endpoint){
    return env['API_LINK']!+endpoint;
  }
}