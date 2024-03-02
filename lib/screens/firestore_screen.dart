import 'package:flutter/material.dart';
import 'package:flutter_application_16/services/firestore_services.dart';

class FirestoreScreen extends StatelessWidget {
  const FirestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async{
                await FirestoreServices.add("Hard disk", 2000, "Black");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Added successfuly"), backgroundColor: Colors.green,)
                );
              }, 
              child: Text("add"),
            ),
            TextButton(
              onPressed: () async{
                await FirestoreServices.setData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("set successfuly"), backgroundColor: Colors.green,)
                );
              }, 
              child: Text("set"),
            ),
             TextButton(
              onPressed: () async{
                await FirestoreServices.delete();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Deleted successfuly"), backgroundColor: Colors.green,)
                );
              }, 
              child: Text("delete"),
            ),
            TextButton(
              onPressed: () async{
                await FirestoreServices.update();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Updated successfuly"), backgroundColor: Colors.green,)
                );
              }, 
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}