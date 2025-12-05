import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient{
  static const String baseUrl = 'http://:8080';

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Uri uri(String endpoint){
    return Uri.parse('$baseUrl$endpoint');
  }
  static Future<http.Response> login(String endpoint, String body)async{
    return await http.post(uri(endpoint), body: body, headers: headers);
  }
  static Future<http.Response> getAuth(String endpoint) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("jwt");

    final authHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await http.get(uri(endpoint), headers: authHeaders);
  }
}