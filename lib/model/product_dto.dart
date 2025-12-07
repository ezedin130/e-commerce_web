import 'dart:convert';

class ProductDto {
  final String name;
  final String description;
  final double price;

  ProductDto({
    required this.name,
    required this.description,
    required this.price,
  });

  String toJsonString() {
    return jsonEncode({
      'name': name,
      'description': description,
      'price': price,
    });
  }
}
