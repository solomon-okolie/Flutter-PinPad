import 'package:flutter/material.dart';

class PinDisplay extends StatelessWidget {
  final int inputLength;

  final int maxLength;

  final Decoration decoration;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  PinDisplay(this.maxLength, this.inputLength,[this.decoration, this.padding, this.margin]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.decoration,
      padding: padding,
      margin: margin,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: Iterable
              .generate(
                  maxLength,
                  (n) => Icon(
                        n >= inputLength ? Icons.lock : Icons.lock_open,
                        size: 20.0,
                      ))
              .toList()),
    );
  }
}
