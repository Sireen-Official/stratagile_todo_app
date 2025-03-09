import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push(Widget route) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => route));
  }

  void pushReplacement(Widget route) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => route),
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushAndRemoveUntil(Widget route) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => route),
      (route) => false,
    );
  }
}
