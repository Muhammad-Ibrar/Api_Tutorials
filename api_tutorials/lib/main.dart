import 'package:api_tutorials/example_five.dart';
import 'package:api_tutorials/example_four.dart';
import 'package:api_tutorials/example_three.dart';
import 'package:api_tutorials/example_two.dart';
import 'package:api_tutorials/home_screen.dart';
import 'package:api_tutorials/signup.dart';
import 'package:api_tutorials/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: UploadImageScreen()
    );
  }
}

