import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  void login(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print("Feeeeh error in email we password");
    }
  }

  Future<bool> register(String email, String password) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }
    catch(e){
      return false;
    }
  }

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  void getUser(){
    User? user = FirebaseAuth.instance.currentUser;
  }
}