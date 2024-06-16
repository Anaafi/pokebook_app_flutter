import 'package:flutter/material.dart';
import 'package:pokebook_app/gen/fonts.gen.dart';

class TextStyles {
  static TextStyle get hero1 => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontWeight: FontWeight.w600,
        fontSize: 48,
      );

  static TextStyle get hero2 => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontWeight: FontWeight.w500,
        fontSize: 32.33,
      );

  static TextStyle get hero3 => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontWeight: FontWeight.w600,
        fontSize: 25.39,
      );

  static TextStyle get label1 => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  static TextStyle get label => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );

  static TextStyle get body => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontSize: 18,
      );

  static TextStyle get bodySmall => const TextStyle(
        color: Colors.black,
        fontFamily: FontFamily.sofiaSans,
        fontSize: 14,
      );
}
