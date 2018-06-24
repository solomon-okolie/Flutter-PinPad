# Pin Pad

A Flutter PinPad Widget.

![Alt Text](https://media.giphy.com/media/ZcowgfJ01fUhNGNO60/giphy.gif)

## Example Usage

````
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinpad/pinpad.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _pin = "";

  Future _getPin() async {
    var result = await Navigator.of(context).push(new MaterialPageRoute<String>(
        builder: (ctx) => PinPad(), fullscreenDialog: true));
    setState(() {
      _pin = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'PIN is :',
            ),
            new Text(
              '$_pin',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _getPin(),
        tooltip: 'Get Pin',
        child: new Icon(Icons.input),
      ),
    );
  }
}

````
