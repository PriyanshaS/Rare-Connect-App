import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rare_connect/landing/form.dart';
import 'package:rare_connect/landing/landing.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
class Choice extends StatelessWidget {
  Choice({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rare Connect" , style: TextStyle(color: Colors.white),),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80.0 , 10 , 80 , 10),
          child: Column(
            children: [
              Card( 
                color: Colors.blue[50],
                child: Column(
                  children: [

                    Image.asset('assets/img/bg.jpg' ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text(textAlign: TextAlign.justify,
                        'You have been diagnosed with a rare disease\nYou have been facing problems sharing your problems with friends or family'),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Formm()),
                    );
                    }, 
                    child: Text("Patient",style: TextStyle(color: Colors.white , fontSize: 20)), style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 40),
                      
                    ),
                              
                    ),
                   
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card
              ( 
                color: Colors.blue[50],
                child: Column(
                  children: [

                    Image.asset('assets/img/bg.jpg' ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text(textAlign: TextAlign.justify,
                        'Your friend/family have been diagnosed with a rare disease\nYou are a verified caretaker/nurse of the patient assigned by a registered organization'),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                    }, 
                    child: Text("Caretaker",style: TextStyle(color: Colors.white , fontSize: 20)), style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 40),
                      
                    ),
                              
                    ),
                   
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}