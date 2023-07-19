import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rare_connect/login/signup/authpage.dart';
import 'package:rare_connect/login/signup/onboarding.dart';
import 'package:rare_connect/login/signup/verify_email.dart';
import 'package:rare_connect/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
  final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: generateMaterialColor(Colors.blue.shade300),
          primaryColor: Colors.blueGrey
        ),
      //.fromRGBO(97, 193, 235, 1)
        home: OnBoardingPage(),
      );
  
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
            else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'),);
            }
            else if(snapshot.hasData)
            {return VerifyEmail();}
            else
            {return AuthPage();}
          },
        ),
      ),
    );
  }
}

