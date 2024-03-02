import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_16/models/product.dart';

enum Size{
  small,
  medium,
  large,
  xLarge,
  xxLarge,
}

class FirestoreServices{

  static Future<void> add(String name, double price, String color) async{
    await FirebaseFirestore.instance.collection("products").add({
      "name": name,
      "price": price,
      "rate": 0,
      "color": color,
    });
  }

  // set works 2 directions (add, update)
  static Future<void> setData() async{
    FirebaseFirestore.instance.collection("products").doc("157").set({
      "name": "Car",
      "price": 500,
      "rate": 4.9,
      "size": "M",
    });
  }

  static Future<void> delete() async{
    await FirebaseFirestore.instance.collection("products").doc("YU9oDiW0Ljr4Y5JPbqVM").delete();
  }

  static Future<void> update() async{
    await FirebaseFirestore.instance.collection("products").doc("nVjSd7ODQETCHWUs2rkP").update({
      "name": "Car",
      "price": 30000000,
      "rate": 5,
      "size": "M",
    });
  }

  static Future< List<Product> > get() async{
    var snapshot = await FirebaseFirestore.instance.collection("products").get();
    var docs = snapshot.docs;
    List<Product> products = [];
    for(var doc in docs){ // ["ahmed", "Mohamed", "hassan"]
      Product p = Product.fromMap(doc.data());
      p.id = doc.id;
      products.add(p);
    }
    return products;
  }
}