import 'package:flutter/material.dart';
import 'package:myapplogin/models/heart_button.dart';
import 'package:myapplogin/models/product_details_logic.dart';
import 'package:myapplogin/pages/productDetails.dart';
import '../models/model.dart';
import '../utils/SizeOfConfig.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product
  });
  final Product product ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) =>ProductDetailsScreen(product : product),),);},

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
                child: Image.asset( product.imageUrl , width: getProportionalWidth(100), height: getProportionalHeight(100),
                  fit: BoxFit.cover,
                ),
              ),
    ),
            // تحجيم
            Expanded(
              child: Padding(padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  // لجعل ابناء الاعمدة في البداية
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 10,),
                    Text("\$ ${product.price}",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       //  يتم ايتدعاء ايقونت القلب لتفضيل المنتج من كلاس heartButtn كلاس تم وضع فيه ايقونة قابلة لتغيير الون
                       HeartButton(),

                        IconButton(onPressed: (){
                          // عند الضغط عل الايقونة يتم اضافة المنتج لسلة الشراء
                          ProductDetailsLogic.addToCart(context, product);
                          },
                          icon:Icon(Icons.shopping_cart_outlined , color: Colors.grey,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
