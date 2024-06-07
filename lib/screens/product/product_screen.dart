import 'package:flutter/material.dart';
import 'package:flutter_future/data/model/product_model.dart';
import 'package:flutter_future/data/provider/app_provider.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/screens/category/widgets/category_item.dart';
import 'dart:async';

import 'package:flutter_future/screens/product/widgets/product_item.dart';

class ProductScreen extends StatefulWidget {
  var category_name;

  ProductScreen({required this.category_name});

  @override
  State<ProductScreen> createState() => _ProductScreenState(category_name: category_name);
}

class _ProductScreenState extends State<ProductScreen> {
  var category_name;
  List<ProductModel> listProduct = [];
  _ProductScreenState({required this.category_name});
  ProductProvider _appProvider = new ProductProvider();
  Future<String> loadCategoryList() async {
    listProduct = await _appProvider.loadData(this.category_name);
    // _appProvider.loadData().then((value) {
    //   print(value);
    //   listProduct = value;
    // });
    print(listProduct);
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadCategoryList();
    print(listProduct);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadCategoryList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading Products"));
        } else if (!snapshot.hasData || listProduct.isEmpty) {
          return const Center(child: Text("No Products available"));
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  this.category_name,
                  style: titleStyle,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listProduct.length,
                    itemBuilder: (context, index) {
                      return ProductItem(productModel: listProduct[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


class Page2 extends StatelessWidget {
  var category_name;
  Page2({required this.category_name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ProductScreen(category_name:category_name),
    );
  }
}
