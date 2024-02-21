import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Home.dart';
import 'forgetPassword.dart';
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=>_Loginpage();

}
class _Loginpage extends State<LoginPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
  final email=TextEditingController();
  final password=TextEditingController();
  late String uEmail;
  late String uPassword;

  final _auth=FirebaseAuth.instance;
  void login(){
    _auth.signInWithEmailAndPassword(email: uEmail, password: uPassword).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (Context)=>Home()));
    }).onError((error,stackTrace){
      showSnackBar(error as String);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(

        height: size.height*1,
        decoration: const BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/Images/background.jpg"),fit: BoxFit.fitHeight),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("Sign In",style: TextStyle(fontSize: size.height*0.05,fontWeight: FontWeight.w300,)),
              SizedBox(height: size.height*0.03,),
              Center(
                child: Container(
                  width: size.width*0.95,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(
                                    color: Colors.cyan
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.circular(21)

                            ),
                            hintText: "Login Id",
                            prefixIcon: Icon(
                                Icons.email_outlined
                            )
                        ),
                        controller: email,
                        validator: (value)=>EmailValidator.validate(value!)?null:"Please enter valid email",

                      ),
                      SizedBox(height: size.height*0.03,),
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.cyan
                              ),
                              borderRadius: BorderRadius.circular(21)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(21)
                          ),
                          hintText: "Password",
                          prefixIcon: Icon(
                              Icons.password
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),

                        obscureText: _obscurePassword,
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height*0.03,),
              ElevatedButton(onPressed: (){
                 uEmail=email.text.toString();
                 uPassword=password.text.toString();
               if(_formKey.currentState!.validate()){
                 login();
               }
              },
                child: Container(
                  height:size.height*0.07,
                  width: size.width*0.35,
                  color: Colors.transparent,
                  child: Center(child: Text("Login",))),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),backgroundColor: Colors.cyan),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    login();
                  },
                      child: Text("Forget Password",style: TextStyle(color: Colors.blueAccent,))),
                ],
              )


            ],

          ),
        ),
      ),

    );

  }

  void showSnackBar(String message) {
    final snackBar=SnackBar(content: Text(message,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

}