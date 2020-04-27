import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final String _username, _subjectname, _class, _lecturename;
  final int _lectureno;
  Test(this._username, this._subjectname, this._lecturename, this._lectureno,
      this._class);
  @override
  State<StatefulWidget> createState() {
    return _TestState(this._username, this._subjectname, this._lecturename,
        this._lectureno, this._class);
  }
}

class _TestState extends State<Test> {
  String _username, _subjectname, _class, _lecturename;
  int _lectureno, count = 1;
  _TestState(this._username, this._subjectname, this._lecturename,
      this._lectureno, this._class);
  final db = Firestore.instance;

  Card buildItem(DocumentSnapshot doc) {
    if(count++<4){
    db
        .collection('Attendance')
        .document(_subjectname)
        .collection('Lectures')
        .document(_lecturename)
        .updateData({doc.documentID: 'Absent'});
    db
        .collection('Batch')
        .document('Classroom')
        .collection(_class)
        .document(doc.documentID)
        .updateData({_subjectname + ' Total': 0, _subjectname + ' Present': 0});
    }
    return Card(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text(
              '${doc.documentID}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 120,
            ),
            IconButton(
              icon: Icon(Icons.done),
              color: Colors.black,
              splashColor: Colors.green,
              iconSize: 33,
              onPressed: () {
                db
                    .collection('Attendance')
                    .document(_subjectname)
                    .collection('Lectures')
                    .document(_lecturename)
                    .updateData({doc.documentID: 'Present'});
                db
                    .collection('Batch')
                    .document('Classroom')
                    .collection(_class)
                    .document(doc.documentID)
                    .updateData({
                  _subjectname + ' Total': _lectureno,
                  _subjectname + ' Present': _lectureno
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              splashColor: Colors.red,
              iconSize: 33,
              onPressed: () {
                db
                    .collection('Attendance')
                    .document(_subjectname)
                    .collection('Lectures')
                    .document(_lecturename)
                    .updateData({doc.documentID: 'Absent'});
                db
                    .collection('Batch')
                    .document('Classroom')
                    .collection(_class)
                    .document(doc.documentID)
                    .updateData({
                  _subjectname + ' Total': _lectureno,
                  _subjectname + ' Present': _lectureno - 1
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Are You Present?",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Stack(children: <Widget>[
              Image.asset(
                'assets/facultyHome.png',
                height: 800,
                width: 600,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 30,
                  left: 7,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: db
                        .collection('Batch')
                        .document('Classroom')
                        .collection(_class)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            children: snapshot.data.documents
                                .map((doc) => buildItem(doc))
                                .toList());
                      } else {
                        return SizedBox();
                      }
                    },
                  )),
            ])),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: new FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text('Submit'),
              icon: Icon(Icons.cloud_done),
              backgroundColor: Colors.pink,
            )));
  }
}
