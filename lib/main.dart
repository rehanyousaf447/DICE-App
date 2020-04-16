import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

int counter = 0;
void main() {
  return runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void increment() {
    setState(() {
      counter++;
      counter = counter % 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DICEE',
            style: TextStyle(
              fontFamily: 'LongCang',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 60.0,
            ),
          ),
          backgroundColor: Colors.blueGrey.shade800,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'NEXT',
          child: Text(
            '$counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.blueGrey.shade800,
          onPressed: () {
            increment();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() {
    return _DicePageState();
  }
}

class _DicePageState extends State<DicePage> {
  int leftimagenumber = 1;
  int rightimagenumber = 1;
  int thirddice = 1;
  int downleft = 1;
  int downright = 1;
  bool Dice1 = false, Dice2 = false, Dice3 = false, Dice4 = false;

  void _AddingDices() {
    if (counter == 1) {
      Dice1 = true;
      Dice2 = false;
      Dice3 = false;
      Dice4 = false;
    } else if (counter > 1 && counter <= 2) {
      Dice1 = false;
      Dice2 = true;
    } else if (counter == 3) {
      Dice1 = false;
      Dice2 = true;
      Dice3 = true;
    } else if (counter > 1 && counter <= 4) {
      Dice1 = false;
      Dice2 = true;
      Dice3 = false;
      Dice4 = true;
    } else {
      Dice1 = false;
      Dice2 = false;
      Dice3 = false;
      Dice4 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _AddingDices();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: Dice1 == true ? D1() : null),
          Container(
            child: Dice2 == true ? D2() : null,
          ),
          Container(
            child: Dice3 == true ? D3() : null,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Dice4 == true ? D4() : null,
          ),
        ]);
  }

  Widget D1() {
    return SafeArea(
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 100.0),
        // padding: EdgeInsets.all(60.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                highlightColor: Colors.black,
                onPressed: () {
                  _RandomNumberGenrating();
                },
                child: Image.asset('images/dice$leftimagenumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget D2() {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            highlightColor: Colors.black,
            onPressed: () {
              _RandomNumberGenrating();
            },
            child: Image.asset('images/dice$leftimagenumber.png'),
          ),
        ),
        Expanded(
          child: FlatButton(
            highlightColor: Colors.black,
            onPressed: () {
              _RandomNumberGenrating();
            },
            child: Image.asset('images/dice$rightimagenumber.png'),
          ),
        ),
      ],
    );
  }

  Widget D3() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(50.0),
            child: FlatButton(
              highlightColor: Colors.black,
              onPressed: () {
                _RandomNumberGenrating();
              },
              child: Image.asset('images/dice$thirddice.png'),
            ),
          ),
        ),
      ],
    );
  }

  Widget D4() {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            highlightColor: Colors.black,
            onPressed: () {
              _RandomNumberGenrating();
            },
            child: Image.asset('images/dice$downleft.png'),
          ),
        ),
        Expanded(
          child: FlatButton(
            highlightColor: Colors.black,
            onPressed: () {
              _RandomNumberGenrating();
            },
            child: Image.asset('images/dice$downright.png'),
          ),
        ),
      ],
    );
  }

  void _RandomNumberGenrating() {
    setState(() {
      leftimagenumber = Random().nextInt(6) + 1;
      rightimagenumber = Random().nextInt(6) + 1;
      downleft = Random().nextInt(6) + 1;
      downright = Random().nextInt(6) + 1;
      thirddice = Random().nextInt(6) + 1;
    });
  }
}
