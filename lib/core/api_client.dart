import 'package:http/http.dart' as http;

class ApiClient{
  static const String baseUrl = 'http://192.168.1.2:8080';

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Uri uri(String endpoint){
    return Uri.parse('$baseUrl$endpoint');
  }
  static Future<http.Response> login(String endpoint, String body)async{
    return await http.post(uri(endpoint), body: body, headers: headers);
  }
}