import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rare_connect/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: IntroductionScreen(
        done: Text('READ'),
        
        onDone: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) {
            return MyHomePage();
          })));
        },
       
        pages: [
          
          
          PageViewModel(
            title:'aaaaaabbbbb',
            body: 'heyeye',
            image: Center(child: Image.asset('assets/img/logo.png', width: 600,)),
            decoration: PageDecoration(titlePadding: EdgeInsets.only(top:100))
          ),
           PageViewModel(
            title:'aaaaaabbbbb',
            body: 'heyeye',
            image: Image.asset('assets/img/logo.png', width: 600,),
           
          ),
           PageViewModel(
            title:'aaaaaabbbbb',
            body: 'heyeye',
            image: Image.asset('assets/img/logo.png', width: 600,),
           
          ),
          

        ],
        next: Icon(Icons.arrow_forward_ios),
        showNextButton: true,
        showSkipButton: true,
        skip: Text('SKIP'),
        ),
    ));
  }
}