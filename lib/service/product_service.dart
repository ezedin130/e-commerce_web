import '../core/api_client.dart';
import '../model/product_dto.dart';

class ProductService {
  Future<bool> createProduct(ProductDto dto) async {
    final response = await ApiClient.postAuth(
      '/product',
      dto.toJsonString(),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed: ${response.body}');
      return false;
    }
  }
}