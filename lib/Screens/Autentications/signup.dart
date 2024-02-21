import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Autentications/loginpage.dart';
import 'package:untitled/Screens/Home.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool _obscurePassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var name=TextEditingController();
    var email=TextEditingController();
    var password=TextEditingController();
    var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
        url: 'https://health-improvement-4a8c6.firebaseapp.com/__/auth/action?mode=action&oobCode=code',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'com.example.android',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');

    return  Scaffold(
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
              AutoSizeText("Sign up",style: TextStyle(fontSize: size.height*0.05,fontWeight: FontWeight.w300,)),
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
                          hintText: "Enter your Name",
                          prefixIcon: Icon(
                            Icons.person
                          )
                        ),
                        controller: name,

                      ),
                      SizedBox(height: size.height*0.03,),
                      // AutoSizeText("Email",style: TextStyle(fontSize: size.height*0.03,color: Colors.black87)),
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
                          hintText: "Email",
                          prefixIcon: Icon(
                              Icons.email_outlined
                          )
                        ),
                        controller: email,
                        validator: (value)=>EmailValidator.validate(value!)?null:"Please enter valid email",
                        // validator: (value)=>EmailValidator.validate(email!.text.toString()!)?null:"Please enter valid email",
                        //   onSaved:(value){
                        //   email=value as TextEditingController;
                        //   } ,

                      ),
                      SizedBox(height: size.height*0.03,),
                      // AutoSizeText("Name",style: TextStyle(fontSize: size.height*0.03,color: Colors.black87)),
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
                          if (value!.length< 7) {
                            return "Password must be at least 7 characters long";
                          }
                          return null;
                        },

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height*0.03,),
              ElevatedButton(
                onPressed: () async {
                String uEmail=email.text.toString();
                String uPassword=password.text.toString();
                String uName=name.text.toString();
                if(_formKey.currentState!.validate()){

                    // try {
                    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //     email: uEmail,
                    //     password: uPassword,
                    //   );
                    //   User? user = userCredential.user;
                    //
                    //   if (user != null) {
                    //     if (!user.emailVerified) {
                    //       // Send verification email
                    //       await sendEmailVerification();
                    //       print('Verification email sent');
                    //     } else {
                    //       print('Email already verified');
                    //     }
                    //   }
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'user-not-found') {
                    //     print('No user found for that email.');
                    //   } else if (e.code == 'wrong-password') {
                    //     print('Wrong password provided for that user.');
                    //   } else {
                    //     print('Failed to sign in: $e');
                    //   }
                    // }
                    FirebaseAuth.instance.sendSignInLinkToEmail(
                        email: uEmail, actionCodeSettings: acs)
                            .catchError((onError) => print('Error sending email verification $onError'))
                            .then((value) => print('Successfully sent email verification'));


                }
              },
                child: Container(
                  height:size.height*0.07,
                  width: size.width*0.35,
                  color: Colors.transparent,
                  child: Center(child:Text("Create account",))),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),backgroundColor: Colors.cyan),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  TextButton(onPressed: () {
                    // String Email=uEmail.text.toString();
                    // String Pass=uPassword.text.toString();
                    // print(Email);
                    // print(Pass);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                   },
                      child: Text("Log in",style: TextStyle(color: Colors.blueAccent,))),
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
  Future<void> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}

