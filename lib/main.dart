import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:phone_auth_project/login.dart';


void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();


  runApp(MaterialApp(

    home: Main(),

  ));

}



class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Gumaan();
  }
}
