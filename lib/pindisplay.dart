import 'package:flutter/material.dart';

class PinDisplay extends StatelessWidget {
  final String input;

  /// required PIN length.
  final int pinLength;

  /// PIN display decoration
  final Decoration decoration;

  /// PIN display padding
  final EdgeInsetsGeometry padding;


  ///PIN display margin
  final EdgeInsetsGeometry margin;

  /// to mask PIN or not. default is true.
  final bool maskInput;

  PinDisplay(this.pinLength, this.input, this.maskInput,
      [this.decoration, this.padding, this.margin]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.decoration,
      padding: padding,
      margin: margin,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: this.maskInput
              ? Iterable.generate(
                  pinLength,
                  (n) => Icon(
                        n >= input.length ? Icons.lock : Icons.lock_open,
                        size: 20.0,
                      )).toList()
              : [Text(this.input,style: TextStyle(fontWeight: FontWeight.bold))]),
    );
  }
}
