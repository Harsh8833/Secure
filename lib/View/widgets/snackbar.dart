import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

SnackBar appSnackBar(text) {
  return SnackBar(
      content: Text(
    text,
  ));
}
