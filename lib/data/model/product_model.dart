class ProductModel {
  String? id;
  String? name;
  double? price;
  String? img;
  String? des;
  String? categoryId;
  ProductModel(
      {this.id, this.name, this.price, this.img, this.des, this.categoryId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    price = double.parse(json['price']!.toString());
    img = json['img']?.toString();
    des = json['des']?.toString();
    categoryId = json['categoryId']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["img"] = img;
    data["des"] = des;
    data["categoryId"] = categoryId;

    return data;
  }
}
