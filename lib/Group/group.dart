import 'package:flutter/material.dart';
import 'package:rare_connect/Group/chat1.dart';

class Group extends StatelessWidget {
  const Group({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
              child: Container(child: Text("Group Chats", textAlign: TextAlign.start,style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(height: 50),
            ListTile(leading: CircleAvatar(backgroundImage:AssetImage('assets/img/group1.jpg'),radius: 40),
            title: Text("Guillian-Barre Syndrome"),
            subtitle: Text('243 people'),
            onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chat1()),
            );
            },
            ),
            Container(height: 2,
            color: Colors.grey.shade300,),
             ListTile(leading: CircleAvatar(backgroundImage:AssetImage('assets/img/group2.jpg'),radius: 40),
            title: Text("Alexithymia"),
            subtitle: Text('243 people'),
            onTap: () {
              
            },
            ),
            Container(height: 2,
            color: Colors.grey.shade300,),


          
          ],
        ),
      ),
    );
  }
}