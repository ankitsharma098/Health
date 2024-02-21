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

   // var firestoreDB = FirebaseFirestore.instance.collection("MentalHealthQuiz").doc('ubWHkpBHy7jmiad7vC6t').snapshots();
 String  buttonName="Next";
 @override
   String ?SelectedAns;
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('MentalHealthQuiz').snapshots(),
        builder: (context,snapshots){
          // // Text(snapshots.data?.docs[index]['Questions']['$index']['description']),
          //     if(!snapshots.hasData) return Center(child: CircularProgressIndicator());
          var k=snapshots.data?.docs.length;
              return Scaffold(

                appBar: AppBar(
                  title: Text("Mental Health Prediction",style: GoogleFonts.tiltNeon(),),
                ),
                body: ListView.builder(
                    itemCount: snapshots.data?.docs.length ?? 0,
                    itemBuilder: (context,int index){
                      // // String text=snapshots.data?.docs[index]['questions'].map((questions){
                      // //   String questionText = questions['text'];
                      // // });
                      // DocumentSnapshot doc = snapshots.data?.docs[index] as DocumentSnapshot<Object?>;
                      // Object? data = doc.data();
                      // if (data!=null) {
                      //    Map<String, dynamic> dataMap = data as Map<String, dynamic>;
                      //    if (dataMap.containsKey('questions')) {
                      //        List<dynamic> questions = dataMap['questions'];
                      //        print(questions[0]);
                      //   // Continue with your code
                      // }
                      // // Map<String, dynamic> questionMap = questions[0]; // Access the map at index 0
                      // // String questionText = doc['title'];
                      String text =snapshots.data?.docs[index]['questions'][i]['text'];
                      List<dynamic> options=snapshots.data?.docs[index]['questions'][i]['options'];

                      return Column(
                      children: [
                        ListTile(
                            title: Text("$text"),
                    ),
                        RadioListTile(
                          title: Text(options[0]),
                            value: options[0],
                            groupValue: SelectedAns,
                            onChanged: (value){
                              setState(() {
                                SelectedAns=value as String?;
                              });
                        }),
                        RadioListTile(
                            title: Text(options[1]),
                            value: options[1],
                            groupValue: SelectedAns,
                            onChanged: (value){
                              setState(() {
                                SelectedAns=value as String?;
                              });
                            }),
                        RadioListTile(
                            title: Text(options[2]),
                            value: options[2],
                            groupValue: SelectedAns,
                            onChanged: (value){
                              setState(() {
                                SelectedAns=value as String?;
                              });
                            }),
                        SizedBox(height: size.height*0.05),
                        Center(
                          child: ElevatedButton(onPressed: () {
                            if(SelectedAns!=null){
                              setState(() {
                                if(i<snapshots.data!.docs.length){
                                  i++;
                                }
                                else if(i==snapshots.data!.docs.length){
                                  buttonName="Submit";
                                }
                              });
                            }
                            else{
                              showErrorMessage("Please Choose the one Answer");
                            }

                          },
                          child: Text("Next")),

                        )
                      ],
                    );
                }),
              );

        });
  }
 void showErrorMessage(String message){
   final snackBar=SnackBar(content: Text(message,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
}


