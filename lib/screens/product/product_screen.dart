import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/data/model/product_model.dart';
import 'package:flutter_future/data/provider/app_provider.dart';
import 'package:flutter_future/screens/product/widgets/product_item.dart';

class ProductScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  const ProductScreen({super.key, required this.categoryModel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<ProductModel>> _futureProductList;
  AppProvider _appProvider = AppProvider();

  @override
  void initState() {
    super.initState();
    _futureProductList =
        _appProvider.loadProductDataByCategory(widget.categoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.name!),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProductList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading products"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products available"));
          } else {
            var listProduct = snapshot.data!;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Product List",
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
      ),
    );
  }
}
