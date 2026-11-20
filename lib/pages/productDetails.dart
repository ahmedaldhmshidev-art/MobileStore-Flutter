import 'package:flutter/material.dart';
import 'package:myapplogin/fieldInput/my_app_bar.dart';
import 'package:myapplogin/models/model.dart';
import '../fieldInput/detailsProduct.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({super.key, required this.product,
  });

  final Product product ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar(product.name),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DetailsProduct( product: product,) ,
      ),
    );
  }
}
