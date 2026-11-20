
import 'package:flutter/material.dart';
import 'package:myapplogin/utils/SizeOfConfig.dart';
import '../models/model.dart';
import '../models/product_details_logic.dart';

class DetailsProduct extends StatelessWidget {
  final Product product ;
  const DetailsProduct({
    super.key,required this . product
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة المنتج
          ClipRRect(borderRadius: BorderRadius.circular(15),

            child: Image.asset(product.imageUrl, height: getProportionalHeight(200), fit: BoxFit.cover,),
          ),

          const SizedBox(height: 20),

          // اسم المنتج
          Text(product.details,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 10),
          // السعر
          Text("\$ ${product.price}", style: const TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold,),
          ),

          const SizedBox(height: 30),

          // زر الإضافة إلى السلة
          ElevatedButton.icon(
            onPressed: () { ProductDetailsLogic.addToCart(context, product);},

            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
            label: const Text("Add to poy", style: TextStyle(color: Colors.white),),


            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );

  }
}


