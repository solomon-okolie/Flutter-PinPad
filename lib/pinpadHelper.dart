import 'dart:async';
import 'package:flutter/material.dart';

import 'pinpad.dart';

class PinPadHelper {
  static Future<String> requestPin(BuildContext context,
      {PinPad pinpad}) async {
    var result = await Navigator.of(context).push(new MaterialPageRoute<String>(
        builder: (ctx) => pinpad == null ? PinPad() : pinpad,
        fullscreenDialog: true));
    return result;
  }
}
