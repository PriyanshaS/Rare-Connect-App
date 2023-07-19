import 'package:flutter/material.dart';

class Formm extends StatelessWidget {
  
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rare Connect')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text('Your details' ,style: TextStyle(fontSize: 30 , color: Color.fromARGB(255, 117, 114, 114))),
                    SizedBox(height: 50,),
                    TextFormField(
                      decoration: InputDecoration(label: Text('Name')),
                      
                    ),
                    SizedBox(height: 20,),
                     TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(label: Text('Bio')
                      ),
                      
                    ),
                    SizedBox(height: 20,),
                     TextFormField(
                      decoration: InputDecoration(label: Text('Blood Group')),
                      
                    ),
                    SizedBox(height: 20,),
                   
                     TextFormField(
                      decoration: InputDecoration(label: Text('Add Reports')),
                      
                    ),

                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}