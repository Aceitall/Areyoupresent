import 'package:flutter/material.dart';
import './homepage.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Are You Present?",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
          Stack(
            children: <Widget> [
              
              Image.asset('assets/firstPage.png',
              height: 800,
              width: 600,
              fit: BoxFit.cover,),
              Positioned(top: 50,left: 50,
              child:
              Text('Are You Present?', style: TextStyle(fontFamily: 'Sedan SC', fontSize: 40, color: Color(0xff322F02), fontWeight: FontWeight.bold),),
              ),
              Builder(builder: 
                (context) => Positioned(
                  bottom: 200,
                  left: 100,
                  child:
                    ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      buttonColor: Color(0xff322F02),
                      
                    child:  
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          child: Text('Go To Home Page', style: TextStyle(fontFamily: 'Sedan SC', fontSize: 20, color: Colors.white),),
                        ),
                      )   
                    )
              )
            ]
           )
          )
        );
  }
}
