import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String email , password)async{
    try{

      Response response = await post(
        // Uri.parse('https://reqres.in/api/register'),
        Uri.parse('https://reqres.in/api/login'),
        body: {

          'email' : email,
          'password'  : password,

        }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());

        // print('Account Created Succssfully');
        print('Logged in Succssfully');
        print(data);
      }
      else{
        print('Failed');
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('SignUp Api'),
        title: Text('Login Api'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration:const InputDecoration(
                hintText: 'Email',

              ),
            ),
           const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration:const InputDecoration(
                hintText: 'password',

              ),
            ),
           const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString() , passwordController.text.toString());
              },
              child: Container(
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:const Center(
                  child: Text('Login' , style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
