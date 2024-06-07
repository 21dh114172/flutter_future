import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/config/routes.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/data/model/product_model.dart';
import 'package:flutter_future/screens/product/product_screen.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  width: 100,
                  height: 100,
                  //clipBehavior: Clip.antiAlias,
                  //decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    product_img_url + productModel.img!,
                    //fit: BoxFit.cover,
                  )),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Price: ${productModel.price.toString()!}",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Description: ${productModel.des.toString()!}",
                    ),
                  ],
                ))
          ],
        ));
  }
}
