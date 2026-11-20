import 'package:flutter/material.dart';
import 'package:myapplogin/models/listProduct.dart';
import '../fieldInput/my_app_bar.dart';
import '../fieldInput/productCard.dart';
import 'cartScreen.dart';
class ProductApp extends StatelessWidget {
   ProductApp({super.key });

  //  قائمة تحمل جميع المنتجات عل شكل كائنات
  final List listProduct = productList ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar("Product"),

      body: Padding(
        padding: EdgeInsets.all(16),
        // تصميم قائمة ديناميكية
        child: ListView.builder(
          // نرسل للقائمة طول القائمة الذي تحمل المنتجات عل شكل كائنات
          itemCount: listProduct.length,
          itemBuilder: (BuildContext context, int index) {
            // هذه الدالة ترجع تصميم البطاقة من المجود في ال contianer
            return ProductCard(
              // كلاس التصميم يحمل كنست بكائن العناصر المختلفة ارسلنا للكائن قائمة الذي تحمل المنتجات عل شكل كائنات
              product: listProduct[index]
            );

          },
        ),



      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined , color: Colors.white,),
          label: const Text( "View cart",
            style: TextStyle(fontSize: 18 , color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );

  }


}

