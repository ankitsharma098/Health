import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/MentalHealthSupport.dart';
import 'package:untitled/Screens/PersonalizedAIgenerted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/Screens/Autentications/loginpage.dart';
import 'package:untitled/Screens/Autentications/signup.dart';


import 'Screens/Home.dart';
//
// User? user = FirebaseAuth.instance.currentUser;
// UserCredential userCredential =  FirebaseAuth.instance.signInAnonymously() as UserCredential;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: FirebaseOptions(
        apiKey: 'AIzaSyB5iqvoVLQODoyqG0OBXO9HiDwAND303j4',
        appId: "1:189026039486:android:411c8b7726afeb1749d0ef",
        messagingSenderId: "189026039486",
        projectId: "health-improvement-4a8c6",)
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


