import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Screens/PersonalizedAIgenerted.dart';

class Personalized extends StatefulWidget {
  const Personalized({super.key});

  @override
  State<Personalized> createState() => _PersonalizedState();
}

class _PersonalizedState extends State<Personalized> {
  var _medicalHistoryController = TextEditingController();
  var _geneticsController = TextEditingController();
  var _lifestyleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(82, 124, 136,1),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title:   AutoSizeText("Questions to Answer",style: GoogleFonts.tiltNeon(color: Colors.black,fontSize: size.height*0.04,fontWeight: FontWeight.w400),),
      toolbarHeight: size.height*0.1,

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child:Padding(
            padding:  EdgeInsets.only(left: 8.0,right: 8.0,top: size.height*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Medical History',
                  style: TextStyle(fontSize: size.height*0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:  size.height*0.005),
                TextField(
                  controller: _medicalHistoryController, // Adjust the number of lines as needed
                  decoration: InputDecoration(
                    hintText: 'Enter your medical history here...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height:  size.height*0.02),
                AutoSizeText(
                  'Tell me About genetics',
                  style: TextStyle(fontSize: size.height*0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:  size.height*0.005),
                TextField(
                  controller: _geneticsController, // Adjust the number of lines as needed
                  decoration: InputDecoration(
                    hintText: 'Enter your genetics details here...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height:  size.height*0.02),
                AutoSizeText(
                  'Tell me About lifestyle',
                  style: TextStyle(fontSize: size.height*0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:  size.height*0.005),
                TextField(
                  controller: _lifestyleController, // Adjust the number of lines as needed
                  decoration: InputDecoration(
                    hintText: 'Enter your lifestyle details here...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: size.height*0.1,),
              Center(
                  child: ElevatedButton(
                    onPressed:() async{
                      String medicalHistoryController=_medicalHistoryController.text.toString();
                      String geneticsController=_geneticsController.text.toString();
                      String lifestyleController=_lifestyleController.text.toString();
                      final String _overallStyle="Hii here is my medicalHistory $medicalHistoryController.value and this is my geneticsController $geneticsController and here is my lifestyle $lifestyleController.Now Suggest me points (numbers or bullets) through which i maintain a Personalized Healthcare";
                     String content=  await googleBard("$_overallStyle") ;
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PersonalizedAIgenerated("$content")));

                    },
                    child: AutoSizeText("Submit",style: GoogleFonts.tiltNeon(),)
              ,style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan,),

              ))

              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
Future<String> googleBard(String prompt)  async {
  final respone= await http.post(

      Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyD3ClgKmibKVwdWv5IWraY14VaWbhdAX_Y'),
      headers: {
        'content-type':'application/json',
        'Cache-Control':'no-cache',
        'Connection':'keep-alive'
      },
      body: jsonEncode({
        "contents":[{"parts":[{"text":"$prompt"}]}]
      })
  );
  if (respone.statusCode == 200){

    String content=jsonDecode(respone.body)['candidates'][0]['content']['parts'][0]['text'];
    content = content.trim();
    print("$prompt");
    print("$content");
    return content;
  }
  else{
    return 'An internal error occurred';
  }
}
