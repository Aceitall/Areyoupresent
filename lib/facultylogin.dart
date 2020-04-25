import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './facultyhome.dart';

class FacultyLogin extends StatefulWidget {
  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {

  String _email, _password;
  final GlobalKey<FormState> _facultyLoginKey = GlobalKey<FormState>();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _facultyLoginKey,
        child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            
            Image.asset('assets/facultyLogin.png',
              height: 800,
              width: 600,
              fit: BoxFit.cover,),

            Container(
              margin: const EdgeInsets.only(top: 400.0, bottom: 100, left: 10, right: 10),
              padding: const EdgeInsets.only(top: 10.0),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.transparent,
                ),
              
               child: Column(
                children: [
                  TextFormField(
                  validator: (input){
                  if(input.isEmpty){
                    return 'Enter a valid E-mail';
                    }
                    return '';
                  },
                  onSaved: (input) => _email = input,
                  style: TextStyle(color: Color(0xff322F02), fontSize: 25),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    fillColor: Colors.white
                    ),
                  ),
            
                  TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter a valid Password';
                      }else if(input.length < 6){
                        return 'Password Short. Enter a valid Password';
                      }
                      return '';
                    },
                    onSaved: (input) => _password = input,
                    style: TextStyle(color: Color(0xff322F02), fontSize: 25),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          fillColor: Colors.white
                    ),
                    obscureText: true,
                  ),
            
                  ButtonTheme(
                    minWidth: 200,
                    height: 50,
                    buttonColor: Color(0xff322F02),
                    
                  child: 
                  RaisedButton(
                    onPressed: (){
                      facultyLogin();
                      },
                    child: Text('Login',  style: TextStyle(color: Colors.white, fontFamily: 'Sedan SC', fontSize: 25  ),),
                    ),
                  )
                ]
              )
            )
          ],
        )
      )
    )
    );
  }
Future <void> facultyLogin() async {
  final formState = _facultyLoginKey.currentState;
  if(formState.validate()){
    formState.save();
    try{
      AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.trim(), password: _password);
      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FacultyHome()));
    }catch(e){
      print(e.message);
    }
  }   
}
}


