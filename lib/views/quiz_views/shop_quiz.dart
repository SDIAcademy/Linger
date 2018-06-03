import 'package:flutter/material.dart';

class ShopQuiz extends StatefulWidget {
  @override
  _ShopQuizState createState() => new _ShopQuizState();
}

class _ShopQuizState extends State<ShopQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700.0,
        child: Text("dont know yet"),
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
