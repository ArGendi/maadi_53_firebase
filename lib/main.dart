import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_16/firebase_options.dart';
import 'package:flutter_application_16/screens/firestore_screen.dart';
import 'package:flutter_application_16/screens/login_screen.dart';
import 'package:flutter_application_16/screens/products_screen.dart';
import 'package:flutter_application_16/screens/profile_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductsScreen(),
      // home: FirebaseAuth.instance.currentUser != null ? 
      //   ProfileScreen() : LoginScreen(),
    );
  }
}


