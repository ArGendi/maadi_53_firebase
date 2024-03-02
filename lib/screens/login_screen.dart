// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_16/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email")
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password")
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                AuthServices auth = AuthServices();
                String email = emailController.text;
                String pass = passController.text;
                auth.login(email, pass);
              }, 
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
              ),
            ),
            ElevatedButton(
              onPressed: (){
                AuthServices auth = AuthServices();
                String email = emailController.text;
                String pass = passController.text;
                auth.register(email, pass).then((value){
                  if(value == true){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Account created successfuly"),
                        backgroundColor: Colors.green,
                      )
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Something wrong happen"),
                        backgroundColor: Colors.red,
                      )
                    );
                  }
                });
              }, 
              child: Text("Register"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}