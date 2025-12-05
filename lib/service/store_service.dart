import 'dart:convert';
import '../core/api_client.dart';

class StoreService {
  Future<Map<String, dynamic>?> getStoreById(int id) async {
    try {
      final response = await ApiClient.getAuth('/get-store-by-id/$id');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to fetch store: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
