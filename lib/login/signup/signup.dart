import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rare_connect/login/signup/onboarding.dart';
import 'utils.dart';
import 'package:rare_connect/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key, required this.onClickedSignUp}) : super(key: key);
  final VoidCallback onClickedSignUp;


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController= TextEditingController();


  @override
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
              children: [
                GestureDetector(child: Icon(Icons.arrow_back_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OnBoardingPage();
                  },));
                }
                ),
                Text("Sign Up"),
              ],
            ),
                 SizedBox(
                height: 60,
                ),
                Row(
                
                  children: [
                    
        
                   Expanded(
                    
                     child: SizedBox(
                      height: 60,
                     
                       child: TextField(
                                   controller: firstNameController,
                                   cursorColor: Colors.white,
                                   textInputAction: TextInputAction.next,
                                   decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) , ),
                     ),
                   ),
                   SizedBox(width: 10,),
                    Expanded(
                    
                     child: SizedBox(
                      height: 60,
                     
                       child: TextField(
                                   controller: lastNameController,
                                   cursorColor: Colors.white,
                                   textInputAction: TextInputAction.next,
                                   decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) , ),
                     ),
                   ),
        
                ],)
                
        
             ,
           SizedBox(height: 20,),
             
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:(email) {
                    if(email !=  null && !EmailValidator.validate(email))
                    return 'Enter a valid email';
                    else
                    return null;
                  }
                  
                ),
        
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  obscureText: true,
                  validator: (value) {
                    if(value != null && value.length <6)
                    {return 'Enter min. 6 characters';}
                    else
                    {return null;}
                  }
                  ,
                ),
        
        
        
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  obscureText: true,
                  validator: (value) {
                    if(value != null && value.length <6 )
                    {return 'Enter min. 6 characters';}
                    else if(value != passwordController.text)
                    return 'Passwords do not match';
                    else 
                    {return null;}
                  }
                  ,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: Colors.white,)
                  ),
                  style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                ),
                SizedBox(height: 20,),
                Text('OR'),

                SizedBox(
                  height: 24,
                ),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(onPressed: (){}, icon: Icon(FontAwesomeIcons.google , color: Colors.red,), label: Text("Google"),
                style:ElevatedButton.styleFrom(backgroundColor: Colors.white , padding: EdgeInsets.only(left: 30 , right: 30, top: 10, bottom: 10 )
                ,elevation: 0.5 ,)),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(FontAwesomeIcons.facebook , color: Color.fromARGB(255, 27, 106, 171),), label: Text("Facebook"),
                
                style:ElevatedButton.styleFrom(backgroundColor: Colors.white , padding: EdgeInsets.only(left: 30 , right: 30, top: 10, bottom: 10 ))),
              
              ],
            ),
            SizedBox(height: 20,),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        text: 'Already a user?  ',
                        children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Log In',
                        style: TextStyle(
                           
                            color: Theme.of(context).colorScheme.secondary),
                      )
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid)
    return ;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } 
    on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
