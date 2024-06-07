import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/data/model/product_model.dart';

class AppProvider {
  Future<List<CategoryModel>> loadData() async {
    var data = await rootBundle.loadString("files/categorylist.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}

class ProductProvider {
  Future<List<ProductModel>> loadData(name) async {
    var data = await rootBundle.loadString("files/${name}/products.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
