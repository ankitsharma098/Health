import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Screens/MentalHealthSupport.dart';
import 'package:untitled/Screens/Personalized.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(82, 124, 136,1),
            appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title:    AutoSizeText("Health Care System",style: GoogleFonts.abhayaLibre(fontSize: size.height*0.05,color:  Color(0xFF013220),fontWeight: FontWeight.w400
            ),),
             toolbarHeight: size.height*0.1,
              ),
      body: Column(
          
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height*0.1,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: size.height*0.15,
               width: size.width*0.35,
               child: Card(
                 color: Colors.teal,
                 shadowColor: Colors.black,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                 child: TextButton(
                   onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> Personalized())),
                   child: Text("Personalized Healthcare",style: GoogleFonts.exo(color: Colors.black,fontSize: size.height*0.02),textAlign: TextAlign.center),
                 ),

               ),
             ),
             Container(
               height: size.height*0.15,
               width: size.width*0.35,
               child: Card(
                 color: Colors.teal,
                 shadowColor: Colors.black,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                 child: TextButton(
                   onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MentalHealth() ));
                   },
                   child: Text("Mental Health Support",style: GoogleFonts.exo(color: Colors.black,fontSize: size.height*0.02),textAlign: TextAlign.center),
                 ),

               ),
             ),
           ],
         ),
         SizedBox(height: size.height*0.02,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: size.height*0.15,
               width: size.width*0.35,
               child: Card(
                 color: Colors.teal,
                 shadowColor: Colors.black,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                 child: TextButton(
                   onPressed: () {  },
                   child: Text("Remote Patient Monitoring:",style: GoogleFonts.exo(color: Colors.black,fontSize: size.height*0.02),textAlign: TextAlign.center),
                 ),

               ),
             ),
             Container(
               height: size.height*0.15,
               width: size.width*0.35,
               child: Card(
                 color: Colors.teal,
                 shadowColor: Colors.black,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                 child: TextButton(
                   onPressed: () {  },
                   child: Text("Health Equity",style: GoogleFonts.exo(color: Colors.black,fontSize: size.height*0.02),textAlign: TextAlign.center),
                 ),

               ),
             ),
           ],
         )
        ],
      ),
      floatingActionButton: Container(
        width: size.width*0.3,
        height: size.height*0.1,
        child: FloatingActionButton(onPressed: () {  },
        child: Text("Emergency"),
          backgroundColor: Colors.red,

        ),
      ),
    );
  }
}
