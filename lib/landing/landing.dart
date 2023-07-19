import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rare_connect/Group/group.dart';
import 'package:rare_connect/information/info1.dart';
import 'package:rare_connect/Profile/profile.dart';
class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int idx = 0 ; 

  void on_tap(int index){
    setState(() {
      idx = index;
    });
  }

  List <Widget> landingData = [
   Profile(),Group(),Info1(),
   
  ];
final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person ,),label: "Profile", backgroundColor: Color.fromARGB(255, 180, 118, 191)),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Information"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark) , label: "Donate"),

        ],
        onTap: on_tap,
        currentIndex: idx,


      ),
      body: landingData[idx],
      
    );
  }
}
