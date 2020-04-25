import 'package:flutter/material.dart';


class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget> [
          Image.asset('assets/studentHome.png',
              height: 800,
              width: 600,
              fit: BoxFit.cover,),
          
          

          Positioned(
            top: 500,
            left: 100,
            
            child:
            ButtonTheme(
              minWidth: 200,
              height: 50,
              buttonColor: Color(0xff322F02),
              child: 
            RaisedButton(
              child: Text('Summary', style: TextStyle(color: Colors.white, fontFamily: 'Sedan SC', fontSize: 25  ),),
              onPressed: (){
            
              },
                ) 
              )
          ),
          
          Positioned(
            top: 600,
            left: 100,
            
            child:
            ButtonTheme(
              minWidth: 200,
              height: 50,
              buttonColor: Color(0xff322F02),
              child: 
            RaisedButton(
              child: Text('Go back', style: TextStyle(color: Colors.white, fontFamily: 'Sedan SC', fontSize: 25  ),),
              onPressed: (){
                Navigator.pop(context);
              },
                ) 
              )
          )

        ]
      ),
    );
  }
}