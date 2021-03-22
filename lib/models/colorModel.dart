import 'package:flutter/material.dart';
import 'dart:math';

class ColorModel extends ChangeNotifier {
  List<Color> _colors = [
    Colors.blueGrey,
    Colors.teal,
    Colors.deepPurple,
    Colors.pinkAccent
  ];
  int i = 1;
  Color _current;
  void colorUpdate() {
    Random random = Random();
    i = random.nextInt(_colors.length);
    _current = _colors[i];
    notifyListeners();
  }

  Color get getColor => _current?? _colors[i];
}



