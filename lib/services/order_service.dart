import 'package:supabase_flutter/supabase_flutter.dart';

class OrderService {
  final supabase = Supabase.instance.client;

  Future<void> placeOrder(
    String userId,
    List<Map<String, dynamic>> items,
  ) async {
    final total = items.fold<double>(
      0.0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );

    final orderResponse =
        await supabase
            .from('orders')
            .insert({
              'user_id': userId,
              'total_price': total,
              'status': 'pending',
            })
            .select()
            .single();

    final orderId = orderResponse['id'];

    for (var item in items) {
      await supabase.from('order_items').insert({
        'order_id': orderId,
        'product_id': item['product_id'],
        'quantity': item['quantity'],
        'price': item['price'],
      });
    }
  }
}
