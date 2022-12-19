import 'dart:ui';

import 'package:flutter/material.dart';

String baseUrl = "http://3.110.122.84";

class Constant {
  static String baseUrl = "http://3.110.122.84";
  static String blogUrl = "${baseUrl}blog/?";
  static const backGround = Color.fromARGB(255, 236, 236, 236);
  static List<dynamic> items = [];
  static int isNewsCached = 0;
  static PageController newsPageViewController =
      PageController(viewportFraction: 1, keepPage: true);
  static PageController screensPageViewController =
      PageController(viewportFraction: 1, keepPage: true);

  static TextEditingController textFieldcontroller = TextEditingController();

  static FocusNode textFieldfocusNode = FocusNode();
}

class ColorPalette {
  static const backGround = Color.fromARGB(248, 255, 255, 255);
  static const grey = Color.fromARGB(244, 251, 245, 255);
}
