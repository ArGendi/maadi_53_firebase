class Product{
  String? id;
  String? name;
  double? price;
  String? type;
  String? imageUrl;

  

  Product({this.name, this.price, this.type, this.imageUrl});
  Product.fromMap(Map<String, dynamic> map){
    name = map["name"];
    price = map["price"].toDouble();
    type = map["type"];
    imageUrl = map["imageUrl"];
  }
}
