
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:intl/message_format.dart';
import 'message.dart';
class Chat1 extends StatefulWidget {
   Chat1({@required disease});
String? disease ;
  @override
  State<Chat1> createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  List<Message> messages =[
   
    Message(text: "Would you like me to recommend some new \nexercises for you? you can practice them at your\nfree time.", date: DateTime(2023), isSentByMe:false),
    Message(text: "You are very welcome, \nyour progress has been \nvery impressive. I’m glad \nto see you come this far.", date: DateTime(2023), isSentByMe: false),
    Message(text: "Hello, I’m feeling better today... \nthank you for recommending those \nexercises, they really helped.\nalthough i’m \nstill looking forward to our \nsession on monday.", date:DateTime(2023), isSentByMe: true),
    Message(date: DateTime(2023),isSentByMe:false,text: "How are you today?\nWere you able to try out\nsome of the exercises\nI recommended? ",)
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return SafeArea
    (
      child: Scaffold(
        appBar: AppBar(
          
          leading: Icon(Icons.arrow_back ,color: Colors.black,


        ),backgroundColor: Colors.white,
        
        actions: [
    
        CircleAvatar(backgroundImage: AssetImage('assets/img/group1.jpg',),radius: 20,),
        SizedBox(height: 30,
        width: 30,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0 , 8 , 100,8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text("Guillain-Barre Syndrome",style: TextStyle(fontSize: 15, color: Colors.black),),
            Text("243 people" , style: TextStyle(color: Colors.grey),)
          ],),
        )
        ]),
        body: Column(
          
          children: [
            Expanded(
              child:GroupedListView<Message , DateTime>(
                padding: EdgeInsets.all(8),
                elements:messages,
                groupBy: (message)=> DateTime(message.date!.year , 
                message.date!.month ,message.date!.day),
                groupHeaderBuilder: (Message message)=> SizedBox(
                  height: 40,
                  
                ),
                itemBuilder: (context , Message message) => Align(
                  alignment: message.isSentByMe!? Alignment.centerRight : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    child: Padding(padding: EdgeInsets.all(12),
                    child: Text(message.text!),),
                  ),
                ),
              )
            ),
            Container(
              color: Colors.grey.shade300,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type your message here...',
                ),
              
               
              ),
            )
          ],
        ),
      ),
    );
  }
}