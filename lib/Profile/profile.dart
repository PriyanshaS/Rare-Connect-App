import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [buildTop(),
        BuildContent()]),
    );
  }
  Widget BuildContent(){
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0,0),
              child: Text('James William', style: TextStyle(fontSize: 20),),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text('Details',style: TextStyle(fontSize:12), ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Groups'),
              ),
              Text('2'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(

                padding: const EdgeInsets.all(4.0),
                child: Text('Blood Group'),
               
              ),
              Text('A+'),
            ],
          ),Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text('Reports'),
          ),
          Image.asset('assets/img/reports.jpeg'),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,16,0 ,0),
            child: Center(
              child: Container(
              child: 
              GestureDetector(child: Text('Log Out',
             ),
              onTap:() => FirebaseAuth.instance.signOut() ,),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom  = profileHeight/2;
    final top = coverHeight - profileHeight/2;
    return  Stack
      (clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage()),

        Positioned
        (top: top,
          child: buildProfileImage())]);}



  Widget buildProfileImage() =>CircleAvatar(
    radius: profileHeight /2 ,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage(
      'assets/img/profile.jpeg'
  ));
  Widget buildCoverImage() =>Container(
    color: Colors.grey,
    child: Image.asset(
      'assets/img/bg.jpg',
      width: double.infinity,
      height: coverHeight,
      fit:BoxFit.cover,

    ),
  );
}