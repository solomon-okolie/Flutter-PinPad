import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinpad/keypad.dart';
import 'package:pinpad/pindisplay.dart';

class PinPad extends StatefulWidget {
  final int pinLength;

  final Decoration buttonDecoration;

  final TextStyle buttonTextStyle;

  final Decoration keyPadDecoration;

  final Decoration decoration;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  final Widget title;

  PinPad(
      {this.pinLength = 6,
      this.padding = const EdgeInsets.all(5.0),
      this.margin = const EdgeInsets.all(5.0),
      this.decoration = const BoxDecoration(),
      this.keyPadDecoration = const BoxDecoration(),
      this.buttonDecoration = const BoxDecoration(),
      this.buttonTextStyle = const TextStyle(),
      @required this.title});

  @override
  _PinPadState createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  List<int> _values;
  String _input = "";

  _PinPadState() {
    _values = InputHelper.getNumbers();
  }

  void addValue(String value) {
    setState(() {
      if (_input.length == 0) {
        _input = value;
      } else {
        _input += value;
        if (_input.length == widget.pinLength)
          Navigator.of(context).pop(_input);
      }
    });
  }

  void remove(dynamic) {
    setState(() {
      if (_input.length == 0) {
        _input = "";
      } else {
        _input = _input.substring(0, _input.length - 1);
      }
    });
  }

  void clear(dynamic) {
    setState(() {
      _input = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: widget.padding,
          margin: widget.margin,
          decoration: widget.decoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.title,
              Container(height: 40.0),
              PinDisplay(widget.pinLength, _input.length),
              Container(
                height: 10.0,
              ),
              KeyPad(
                  _values,
                  this.addValue,
                  this.remove,
                  this.clear,
                  widget.keyPadDecoration,
                  widget.buttonDecoration,
                  widget.buttonTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}

class InputHelper {
  static List<int> getNumbers() {
    var numberSet = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    var randomSet = new List<int>();

    var random = new Random();

    while (numberSet.length > 0) {
      var randomIndex = random.nextInt(numberSet.length);
      var selectedEntry = numberSet[randomIndex];
      randomSet.add(selectedEntry);
      numberSet.removeAt(randomIndex);
    }

    return randomSet;
  }
}
