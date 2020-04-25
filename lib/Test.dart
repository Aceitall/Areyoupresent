import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _subjectname;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Are You Present?",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: <Widget>[
          Image.asset(
            'assets/facultyHome.png',
            height: 800,
            width: 600,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 490,
              left: 85,
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("Users")
                      .document("Aceitincs")
                      .collection("Subjects")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> subjects = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        subjects.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(
                                  fontFamily: 'Sedan SC',
                                  fontSize: 20,
                                  color: Color(0xff322F02),
                                  fontWeight: FontWeight.bold),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return DropdownButton(
                        items: subjects,
                        onChanged: (subjectName) {
                          print(subjectName);
                          setState(() {
                            _subjectname = subjectName;
                          });
                        },
                        value: _subjectname,
                        isExpanded: false,
                        hint: new Text(
                          "Choose Subject",
                          style: TextStyle(
                              fontFamily: 'Sedan SC',
                              fontSize: 20,
                              color: Color(0xff322F02),
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return Container(width: 0.0, height: 0.0);
                  })),
          Positioned(
              top: 540,
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
                    onPressed: () {
                      attendance();
                    },
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
                      'Summary',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sedan SC',
                          fontSize: 25),
                    ),
                    onPressed: () {},
                  ))),
        ])));
  }

  void attendance() {
    print(_subjectname);
  }
}
