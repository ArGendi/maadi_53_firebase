import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServices{
  void upload(File file) async{
    FirebaseStorage.instance.ref().child("flutter.jpg").putFile(file);
  }

  Future<String> getFile() async{
    String url = await FirebaseStorage.instance.ref().child("flutter.jpg").getDownloadURL();
    return url;
  }
}