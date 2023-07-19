import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin ? Login(onClickedSignUp: toggle) :
    Signup(onClickedSignUp: toggle);

  }

  void toggle()=>
  setState(() {
    isLogin=!isLogin;
  });
}