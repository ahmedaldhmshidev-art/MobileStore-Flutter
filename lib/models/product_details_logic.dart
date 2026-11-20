import 'package:flutter/material.dart';
import 'package:myapplogin/models/model.dart';

import 'cartProcess.dart';

class ProductDetailsLogic {
  static void addToCart(BuildContext context, Product product) {
    Cart.add(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} تمت إضافته إلى السلة!'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
