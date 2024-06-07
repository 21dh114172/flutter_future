import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(color: Colors.grey),
      child: Container(
        width: 150,
        height: 120,
        //clipBehavior: Clip.antiAlias,
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          img_url + categoryModel.img!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
