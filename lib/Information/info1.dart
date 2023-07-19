import 'package:flutter/material.dart';

class Info1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(centerTitle:true,title: Text("Rare Connect")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("Guillain-Barre" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500 ,color: Color.fromARGB(255, 75, 75, 75))),
                SizedBox( height: 20,),
            Text(
              "Guillain-Barre syndrome (GBS) is a rare disorder in which the immune system attacks the peripheral nervous system, causing weakness, numbness, and tingling sensations. GBS can affect people of any age or gender, and the exact cause is unknown, although it is often triggered by an infection, such as a respiratory or gastrointestinal infection.",
              textAlign: TextAlign.justify,
            style: TextStyle(color:  Color.fromARGB(255, 54, 54, 54)),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0 , 40 , 275 , 10 ),
                child: Text("Symptoms" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , ),),
              ),
              Card(
                elevation: 0.5,
                color: Color.fromARGB(255, 184, 130, 220),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text( 
                    "The most common symptoms of GBS include muscle weakness, tingling or prickling sensations in the hands and feet, and difficulty walking or standing. In severe cases, GBS can lead to complete paralysis of the arms, legs, and respiratory muscles, which can be life-threatening and require hospitalization.",
                     textAlign: TextAlign.justify,),
                )),
                Padding(
                padding: const EdgeInsets.fromLTRB(0 , 40 , 275 , 10 ),
                child: Text("Treatment" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , ),),
              ),
              Card(
                elevation: 0.5,
                color: Color.fromARGB(255, 148, 75, 197),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text( 
                    "Treatment for GBS usually involves supportive care, such as pain relief and physical therapy to help patients regain strength and mobility. In some cases, medications such as intravenous immunoglobulin or plasma exchange may be used to help reduce the severity of the immune system's attack on the nerves."
                    ,textAlign: TextAlign.justify, ),
                )),
                Padding(
                padding: const EdgeInsets.fromLTRB(0 , 40 , 275 , 10 ),
                child: Text("View In AR" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 , ),),
              ),
              Image.asset('assets/img/ar.jpeg'),
              SizedBox(
                height: 50,
              ),
                Card(
                elevation: 0.5,
                color: Color.fromARGB(255, 202, 177, 218),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text( 
                    "Recovery from GBS can be slow and may take several months to years. However, with proper treatment and care, most people with GBS make a full recovery and are able to resume their normal activities."
                    ,textAlign: TextAlign.justify, ),
                )),
      
                
              ],
            ),
          ),
        ),
      )
    );
  }
}