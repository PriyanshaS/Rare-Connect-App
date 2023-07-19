import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rare_connect/login/signup/onboarding.dart';
import 'forgot_password.dart';
import 'package:rare_connect/main.dart';
import 'utils.dart';
class Login extends StatefulWidget {
  const Login({Key? key, required this.onClickedSignUp}) : super(key: key);
  final VoidCallback onClickedSignUp;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [Row(
            children: [
              GestureDetector(child: Icon(Icons.arrow_back_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OnBoardingPage();
                },));
              }
              ),
              Text("Log In"),
            ],
          ),
          SizedBox(height: 50,),
          
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,8),
              child: TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) , ),
              ),
            
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,8),
              child: TextField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: signIn,
             
              child: Text(
                'Log In',

                style: TextStyle(fontSize: 20,
                color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 250),
                child: Text('Forgot Password? ',
                textAlign: TextAlign.end,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 12,
                ),
                ),
              ),
              onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
              ForgotPassword(),)),
            ),


            Text('OR'),
              SizedBox(
              height: 20,
            ),
           




            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(onPressed: (){}, icon: Icon(FontAwesomeIcons.google , color: Colors.red,), label: Text("Google"),
                style:ElevatedButton.styleFrom(backgroundColor: Colors.white , padding: EdgeInsets.only(left: 30 , right: 30, top: 10, bottom: 10 ))),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(FontAwesomeIcons.facebook , color: Color.fromARGB(255, 27, 106, 171),), label: Text("Facebook"),
                
                style:ElevatedButton.styleFrom(backgroundColor: Colors.white , padding: EdgeInsets.only(left: 30 , right: 30, top: 10, bottom: 10 ))),
              
              ],
            ),
            SizedBox(height: 20,),
            RichText(
                text:
                 TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    text: 'No account?  ',
                    children: [
                  TextSpan(
        
                    recognizer: TapGestureRecognizer()..onTap =  widget.onClickedSignUp,      
                    text: 'Sign Up',
                    style: TextStyle(
                        
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
