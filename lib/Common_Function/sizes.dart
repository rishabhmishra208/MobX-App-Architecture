import 'dart:math';
import 'package:flutter/cupertino.dart';

class Sizes {
  static double h = 0, w = 0, crossLength = 0;
  static double px8 = 0,
      px10 = 0,
      px12 = 0,
      px14 = 0,
      px16 = 0,
      px18 = 0,
      px20 = 0,
      px22 = 0,
      px25 = 0;
  static void init(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    crossLength = pow((h * h) + (w * w), 1 / 2) as double;
    px8 = Sizes.crossLength * 0.009;
    //fixed px10 = Sizes.crossLength * 0.012;
    //fixed px12 = Sizes.crossLength * 0.014;
    //fixed px14 = Sizes.crossLength * 0.0155;
    //fixed px16 = Sizes.crossLength * 0.018;
    //fixed px18 = Sizes.crossLength * 0.020;
    //fixed px20 = Sizes.crossLength * 0.022;
    //fixed px22 = Sizes.crossLength * 0.024;
    //px25 = Sizes.crossLength * 0.03; // fixed
  }
}
