import 'package:are_you_present/facultylogin.dart';
import 'package:flutter/material.dart';
import './facultylogin.dart';
import './studentlogin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children:
          <Widget>[
            
            Image.asset('assets/loginPage.png',
              height: 800,
              width: 600,
              fit: BoxFit.cover,),

            Positioned(
            top: 300,
            left: 100,
            child:
            ButtonTheme( 
              minWidth: 200,
              height: 50,
              buttonColor: Color(0xff322F02),

              child: RaisedButton(
              child: Text('Faculty Login', style: TextStyle(color: Colors.white, fontFamily: 'Sedan SC', fontSize: 25 ),),
              onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FacultyLogin()));
                      },
                ),
              )
            ),
            Positioned(
            top: 400,
            left: 100,
            
            child:
            ButtonTheme(
              minWidth: 200,
              height: 50,
              buttonColor: Color(0xff322F02),
              child: 
            RaisedButton(
              child: Text('Student Login', style: TextStyle(color: Colors.white, fontFamily: 'Sedan SC', fontSize: 25  ),),
              onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentLogin()));
              },
                ) 
              )
            )
          ]
      ),
    );
  }
}

