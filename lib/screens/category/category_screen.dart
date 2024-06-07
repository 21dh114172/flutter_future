import 'package:flutter/material.dart';
import 'package:flutter_future/config/const.dart';
import 'package:flutter_future/data/model/category_model.dart';
import 'package:flutter_future/data/provider/app_provider.dart';
import 'package:flutter_future/screens/category/widgets/category_item.dart';
import 'dart:async';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> listCategory = [];
  AppProvider _appProvider = new AppProvider();
  Future<String> loadCategoryList() async {
    listCategory = await _appProvider.loadData();
    // _appProvider.loadData().then((value) {
    //   print(value);
    //   listCategory = value;
    // });
    print(listCategory);
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadCategoryList();
    print(listCategory);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadCategoryList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading categories"));
        } else if (!snapshot.hasData || listCategory.isEmpty) {
          return const Center(child: Text("No categories available"));
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Category List",
                  style: titleStyle,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listCategory.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(categoryModel: listCategory[index]);
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
