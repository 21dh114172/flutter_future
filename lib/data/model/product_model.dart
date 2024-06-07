class ProductModel {
  String? id;
  String? name;
  double? price;
  String? img;
  String? des;

  ProductModel({this.id, this.name, this.price, this.img, this.des});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    price = json['price'] != null ? double.parse(json['price'].toString()) : null;
    img = json['img']?.toString();
    des = json['des']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["img"] = img;
    data["des"] = des;
    return data;
  }
}
