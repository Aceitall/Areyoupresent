import 'package:flutter/material.dart';
import 'dart:async';
import './studenthome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  String _username, _password;
  final GlobalKey<FormState> _studentLoginKey = GlobalKey<FormState>();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _studentLoginKey,
        child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            
            Image.asset('assets/studentLogin.png',
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
                    return 'This field cannot be left empty';
                    }
                  },
                  onSaved: (input) => _username = input,
                  style: TextStyle(color: Color(0xff322F02), fontSize: 25),
                  decoration: InputDecoration(
                    labelText: 'Username',
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
                        return 'This field cannot be left empty';
                      }else if(input.length < 8){
                        return 'Password too short. Please enter a valid Password';
                      }
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
                      studentLogin();
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

Future <void> studentLogin() async {
  final formState = _studentLoginKey.currentState;
  if(formState.validate()){
    formState.save();
    try{
      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentHome()));
    }catch(e){
      print(e.message);
    }
  }   
}
}