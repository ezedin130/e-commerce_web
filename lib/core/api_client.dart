import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const String baseUrl = 'http://:8080';

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Uri uri(String endpoint) {
    return Uri.parse('$baseUrl$endpoint');
  }

  static Future<http.Response> login(String endpoint, String body) async {
    return await http.post(uri(endpoint), body: body, headers: headers);
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("jwt");
  }

  static Future<Map<String, String>> _getAuthHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static Future<http.Response> getAuth(String endpoint) async {
    return http.get(uri(endpoint), headers: await _getAuthHeaders());
  }

  static Future<http.Response> postAuth(String endpoint, String body) async {
    return http.post(
      uri(endpoint),
      headers: await _getAuthHeaders(),
      body: body,
    );
  }

  static Future<http.Response> putAuth(String endpoint, String body) async {
    return http.put(
      uri(endpoint),
      headers: await _getAuthHeaders(),
      body: body,
    );
  }

  static Future<http.Response> deleteAuth(String endpoint) async {
    return http.delete(uri(endpoint), headers: await _getAuthHeaders());
  }
}
