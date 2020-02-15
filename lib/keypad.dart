import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {

  /// decoration for the KeyPad.
  final Decoration decoration;

  /// decoration for the buttons on the KeyPad.
  final Decoration buttonDecoration;

  /// to scramble the position of input keys.
  final bool scrambleKeys;

  final ValueChanged<String> addInput;

  final ValueChanged removeInput;

  final ValueChanged clear;

  final List<int> numbers;

  /// styles for the buttons on the KeyPad
  final TextStyle buttonTextStyle;

  KeyPad(this.numbers, this.addInput, this.removeInput, this.clear,
      [this.scrambleKeys,this.decoration, this.buttonDecoration, this.buttonTextStyle]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Column(
        children: <Widget>[
          _buildRow(numbers.sublist(0, 3)),
          _buildRow(numbers.sublist(3, 6)),
          _buildRow(numbers.sublist(6, 9)),
          _buildLastRow()
        ],
      ),
    );
  }

  Widget _buildRow(List<int> inputs) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: inputs
            .map((value) => IconButton(
                  icon: Text(value.toString(),style: buttonTextStyle),
                  onPressed: () => addInput(value.toString()),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildLastRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => clear(null),
          ),
          IconButton(
            icon: Text(numbers.last.toString(), style: buttonTextStyle),
            onPressed: () => addInput(numbers.last.toString()),
          ),
           IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () => removeInput(null),
          ),
        ],
      ),
    );
  }
}
