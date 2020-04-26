import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body:  DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceFace(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){
                changeDiceFace();
                if(leftDiceNumber == rightDiceNumber){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.green,
                          title: Text("Player 1 Won!       Play Again?"),
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                          titlePadding: EdgeInsets.all(3),
                          content: Image.asset("images/won.gif"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Yes"),
                              textColor: Colors.black,
                            ),
                            FlatButton(
                              onPressed: () =>  (SystemNavigator.pop()),
                              child: Text("No"),
                              textColor: Colors.black,
                            ),
                          ],
                        );
                      });
                };
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),),
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                  changeDiceFace();
                  if(leftDiceNumber == rightDiceNumber){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.green,
                            title: Text("Player 2 Won! Play Again?"),
                            content: Image.asset("images/won.gif"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Yes"),
                                textColor: Colors.black,
                              ),
                              FlatButton(
                                onPressed: () =>  (SystemNavigator.pop()),
                                child: Text("No"),
                                textColor: Colors.black,
                              ),
                            ],
                          );
                        });
                  };
                },
              child: Image.asset("images/dice$rightDiceNumber.png"),),
          ),
        ],
      ),
    );
  }
}




