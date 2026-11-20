import 'package:flutter/material.dart';
import 'package:myapplogin/fieldInput/my_app_bar.dart';
import 'package:myapplogin/models/cartProcess.dart';
import 'package:myapplogin/utils/SizeOfConfig.dart';
import '../models/model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.items;

    return Scaffold(
      appBar: myAppBar("Cart"),

      body: cartItems.isEmpty ? const Center(child: Text('السلة فارغة'))
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, // عمودين
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),

        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final Product product = cartItems[index];

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(borderRadius: BorderRadius.circular(15),
                    child: Image.asset(product.imageUrl, fit: BoxFit.cover, height: getProportionalHeight(100),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                Text("\$ ${product.price}", style: const TextStyle(color: Colors.grey)),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم تأكيد شراء ${product.name}' ),
                          backgroundColor: Colors.grey,
                          ),
                        );
                      },
                      child: const Text("تأكيد" , style: TextStyle(color: Colors.black),),

                    ),

                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          Cart.remove(product);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
