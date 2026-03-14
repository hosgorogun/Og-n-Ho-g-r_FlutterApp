import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailScreen.routeName,
          arguments: product,
        );
      },
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(product.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => product.toggleFavorite(),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => cart.addItem(product),
          ),
        ),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}