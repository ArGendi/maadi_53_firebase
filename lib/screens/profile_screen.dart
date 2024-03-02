import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_16/services/storage_services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? image;

  void getImage() async{
    StorageServices storage = StorageServices();
    image = await storage.getFile();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async{
                ImagePicker picker = ImagePicker();
                XFile? x = await picker.pickImage(source: ImageSource.camera);
                if(x != null){
                  File file = File(x.path);
                  // upload photo to server
                  StorageServices storage = StorageServices();
                  storage.upload(file);
                }
              }, 
              icon: Icon(Icons.camera_alt),
            ),
            if(image != null)
            Image.network(
              image!,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}