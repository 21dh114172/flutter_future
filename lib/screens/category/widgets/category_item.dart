import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/config/routes.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/screens/product/product_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Container(
          width: 150,
          height: 120,
          child: CupertinoButton(
            child: Image.asset(
              img_url + categoryModel.img!,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Routes.instance.push(widget: ProductScreen(categoryModel: categoryModel), context: context);
            },
          )),
    );
  }
}
