import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/data/model/product_model.dart';

class AppProvider {
  Future<List<CategoryModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/categorylist.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> loadProductData() async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> loadProductDataByCategory(CategoryModel category) async {
    List<ProductModel> allProducts = await loadProductData();
    // Filter products by category
    List<ProductModel> categoryProducts = allProducts.where((product) => product.categoryId == category.id).toList();
    return categoryProducts;
  }
}
