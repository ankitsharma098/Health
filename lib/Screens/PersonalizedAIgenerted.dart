import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
String Contennt="";
class PersonalizedAIgenerated extends StatefulWidget {
  final String content;

   PersonalizedAIgenerated(this.content);

  @override
  State<PersonalizedAIgenerated> createState() => _PersonalizedAIgeneratedState("$content");
}

class _PersonalizedAIgeneratedState extends State<PersonalizedAIgenerated> {
  final String PersonalisedSoln;
  _PersonalizedAIgeneratedState(this.PersonalisedSoln);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: AutoSizeText("Recommendations to be Fit And Fine",
          maxLines: 2, // Set the maximum number of lines
          overflow: TextOverflow.ellipsis, ),
      ),
        body:  Padding(
          padding:  EdgeInsets.only(top:size.height*0.02,left: size.width*0.01),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
            width: size.width*1,
            child: Text("$PersonalisedSoln",style: GoogleFonts.tiltNeon(color: CupertinoColors.black,fontSize: size.height*0.02,),),),
          ),
        )
    );


  }
}


