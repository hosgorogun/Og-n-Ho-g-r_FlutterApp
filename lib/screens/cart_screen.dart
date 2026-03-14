import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Sepetiniz')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) {
                final item = cartItems[i];
                return ListTile(
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, e, s) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(item.title),
                  subtitle: Text('${item.price.toStringAsFixed(2)} TL'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => cart.removeItem(item.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Toplam: ${cart.totalPrice.toStringAsFixed(2)} TL',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}