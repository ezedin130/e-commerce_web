import 'dart:convert';

import 'package:e_commerce_mobile/core/api_client.dart';

class OrderService{
  Future<Map<String, dynamic>?> getOrderById(int id)async {
    try{
      final response = await ApiClient.getAuth('/get-order-by-id/$id');
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        print('Failed to fetch order: ${response.body}');
        return null;
      }
    }catch(e){
      print('Error: $e');
      return null;
    }
  }
  Future<List<dynamic>?> getAllOrders() async {
    try {
      final response = await ApiClient.getAuth('/order-from-store-owner');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to fetch orders: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching orders: $e');
      return null;
    }
  }
}