import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(
            product.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (ctx, error, stackTrace) =>
                Image.asset('assets/images/placeholder.png', height: 300),
          ),
          const SizedBox(height: 10),
          Text('${product.price} TL',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(product.description),
          ),
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Sepete Ekle'),
            onPressed: () => cart.addItem(product),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}