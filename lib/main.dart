import 'package:flutter/material.dart';
import 'package:signup/HomeScreen.dart';
import 'package:signup/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


    class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Homescreen()
    );
  }
}