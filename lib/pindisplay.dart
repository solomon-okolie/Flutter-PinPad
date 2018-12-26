import 'package:flutter/material.dart';

class PinDisplay extends StatelessWidget {
  final String input;

  final int maxLength;

  final Decoration decoration;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  final bool maskInput;

  PinDisplay(this.maxLength, this.input, this.maskInput,
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
          children: input.length<1? [Text(" ")]: Iterable.generate(
              maxLength,
              (n) => this.maskInput
                  ? Icon(
                      n >= input.length ? Icons.lock : Icons.lock_open,
                      size: 20.0,
                    )
                  : Text(input[n-1])).toList()),
    );
  }
}
