import 'package:flutter/material.dart';
import 'package:flutter_application_16/models/product.dart';
import 'package:flutter_application_16/services/firestore_services.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> allProducts = [];

  void getAllProducts() async{
    allProducts = await FirestoreServices.get();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index){
          return Column(
            children: [
              Text(allProducts[index].name.toString()),
              Text(allProducts[index].price.toString()),
            ],
          );
        }, 
        separatorBuilder: (context, index){
          return SizedBox(height: 20,);
        }, 
        itemCount: allProducts.length,
      ),
    );
  }
}