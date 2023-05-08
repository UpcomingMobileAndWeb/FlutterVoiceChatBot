import 'package:flutter/cupertino.dart';

class HomeModelProvider with ChangeNotifier {
  InputType inputType = InputType.text;
  String text = '';

  switchInputType() {
    switch (inputType) {
      case InputType.text:
        inputType = InputType.speak;
        break;
      case InputType.speak:
        inputType = InputType.text;
        break;
    }
    notifyListeners();
  }

  setTest(String text) {
    this.text = text;
    notifyListeners();
  }
}

enum InputType {
  text,
  speak,
}
