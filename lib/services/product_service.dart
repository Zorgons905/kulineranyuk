import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await supabase
        .from('products')
        .select('*')
        .eq('available', true);
    return response;
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String merchantId,
  }) async {
    await supabase.from('products').insert({
      'name': name,
      'description': description,
      'price': price,
      'merchant_id': merchantId,
      'available': true,
    });
  }
}
