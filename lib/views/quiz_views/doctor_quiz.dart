import 'package:flutter/material.dart';

class DoctorQuiz extends StatefulWidget {
  @override
  _DoctorQuizState createState() => new _DoctorQuizState();
}

class _DoctorQuizState extends State<DoctorQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700.0,
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
              "http://www.englishlanguageclub.co.uk/wp-content/uploads/2014/08/Cartoon-thumbs.052.jpeg"),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        child: Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "Instruction Text",
                    style: TextStyle(fontSize: 30.0, fontFamily: "Brela"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
