import 'package:flutter/material.dart';

class FacultyHome extends StatefulWidget {
  @override
  _FacultyHomeState createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Image.asset(
          'assets/facultyHome.png',
          height: 800,
          width: 600,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: 425,
            left: 85,
            child: ButtonTheme(
                minWidth: 200,
                height: 50,
                buttonColor: Color(0xff322F02),
                child: RaisedButton(
                  child: Text(
                    'Take Attendance',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sedan SC',
                        fontSize: 25),
                  ),
                  onPressed: () {},
                ))),
        Positioned(
            top: 500,
            left: 100,
            child: ButtonTheme(
                minWidth: 200,
                height: 50,
                buttonColor: Color(0xff322F02),
                child: RaisedButton(
                  child: Text(
                    'Summary',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sedan SC',
                        fontSize: 25),
                  ),
                  onPressed: () {},
                ))),
        Positioned(
            top: 600,
            left: 100,
            child: ButtonTheme(
                minWidth: 200,
                height: 50,
                buttonColor: Color(0xff322F02),
                child: RaisedButton(
                  child: Text(
                    'Go back',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sedan SC',
                        fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )))
      ]),
    );
  }
}
