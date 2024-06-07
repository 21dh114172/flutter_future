import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/data/model/product_model.dart';
//import 'package:flutter_future/screens/product_detail/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap:() {
      //   Navigator.push(
      //     context, 
      //     MaterialPageRoute(
      //       builder: (context) => ProductDetailScreen(product: productModel)
      //     )
      //   );
      // },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(color: Colors.white54),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 120,
              child: Image.asset(
                img_url + productModel.img!,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(productModel.des ?? '', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  Text('\$${productModel.price?.toStringAsFixed(2) ?? ''}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
