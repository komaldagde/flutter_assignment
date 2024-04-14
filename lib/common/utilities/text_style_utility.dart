import 'package:flutter/material.dart';

class TextStyleUtility {
  const TextStyleUtility._();

  static commonTextStyle(
    BuildContext context,
    Color color,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      fontFamily: 'Abel',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: TextOverflow.visible,
    );
  }
}
