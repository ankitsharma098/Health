import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  @override
  Widget build(BuildContext context) {
    var email=TextEditingController();
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(

        height: size.height*1,
        decoration: const BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/Images/background.jpg"),fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText("Forget Password",style: TextStyle(fontSize: size.height*0.03,fontWeight: FontWeight.w300,)),
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
                          hintText: "Enter a email address",
                          prefixIcon: Icon(
                              Icons.email_outlined
                          )
                      ),
                      controller: email,

                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height*0.03,),
            ElevatedButton(onPressed: (){
              // if(email!=null && password!=null)
              // {
              //
              //   Navigator.push(context, MaterialPageRoute(builder: (Context)=>LoginPage()));
              // }
              // else{
              //   showSnackBar("Please fill the Correct details");
              // }
            },
              child: Container(
                  height:size.height*0.07,
                  width: size.width*0.35,
                  color: Colors.transparent,
                  child: Center(child: Text("Forget Password",))),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),backgroundColor: Colors.cyan),),

          ],

        ),
      ),

    );
  }

  void showSnackBar(String message) {
    final snackBar=SnackBar(content: Text(message,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
