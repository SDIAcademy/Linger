import 'package:flutter/material.dart';

class GeneralQuiz extends StatefulWidget {
  @override
  _GeneralQuizState createState() => new _GeneralQuizState();
}

class _GeneralQuizState extends State<GeneralQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image(
            image: NetworkImage(
                "https://i.ytimg.com/vi/Gya1UzizvlQ/maxresdefault.jpg"),
            height: 350.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Random Text",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Random Text",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Random Text",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Random Text",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () {Navigator.of(context).pop();},
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
        ],
      ),
    );
  }
}
