import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';


class MentalHealth extends StatefulWidget {
  const MentalHealth({super.key});

  @override
  State<MentalHealth> createState() => _MentalHealthState();
}

class _MentalHealthState extends State<MentalHealth> {
 int i=0;

   var firestoreDB = FirebaseFirestore.instance.collection("MentalHealthQuiz")
       .snapshots();

 var radio1=Icon(Icons.radio_button_off);
 var radio2=Icon(Icons.radio_button_off);
 var radio3=Icon(Icons.radio_button_off);
  @override

  List<String> Question=["Question1","Question2","Question3","Question4","Question5","Question6","Question7","Question8","Question9","Question10"];
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return StreamBuilder(
            stream: firestoreDB,
        builder: (context,snapshots){

              if(!snapshots.hasData) return Center(child: CircularProgressIndicator());
              return Scaffold(
                appBar: AppBar(
                  title: Text("Mental Health Prediction",style: GoogleFonts.tiltNeon(),),
                ),
                body: ListView.builder(
                    itemCount: snapshots.data?.docs.length ?? 0,

                    itemBuilder: (context,int index){
                      var question = Question?[index];
                    i=i+1;
                    return ListTile(
                        title: Text(snapshots.data?.docs[index]['Questions']['$index']['description']),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          ListTile(
                            leading: radio1,
                            title:   TextButton(onPressed: (){
                            setState(() {
                              radio1=Icon(Icons.radio_button_checked);
                              var radio2=Icon(Icons.radio_button_off);
                              var radio3=Icon(Icons.radio_button_off);

                            });
                            }, child: AutoSizeText(snapshots.data?.docs[index]['Questions']['$index']['option1'],textAlign: TextAlign.start,style: GoogleFonts.exo(fontSize: size.height*0.02),),),
                          ),
                            ListTile(
                              leading: radio2,
                              title: TextButton(onPressed: (){
                                setState(() {
                                  var radio3=Icon(Icons.radio_button_off);
                                   radio2=Icon(Icons.radio_button_checked);
                                  var radio1=Icon(Icons.radio_button_off);
                                });
                              }, child: Text(snapshots.data?.docs[index]['Questions']['$index']['option2'],style: GoogleFonts.exo(fontSize: size.height*0.02),),),
                            ),
                            ListTile(
                              leading: radio3,
                              title: TextButton(

                                onPressed: (){
                                  setState(() {
                                    var radio1=Icon(Icons.radio_button_off);
                                    var radio2=Icon(Icons.radio_button_off);
                                    radio3=Icon(Icons.radio_button_checked);
                                  });
                                }, child: Text(snapshots.data?.docs[index]['Questions']['$index']['option3'],style: GoogleFonts.exo(fontSize: size.height*0.02),),),
                            )
                          ],
                        ),
                    );
                }),
              );

        });
  }
}

