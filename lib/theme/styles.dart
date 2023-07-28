import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle get labelLarge => const TextStyle(
      fontFamily: 'Quicksand',
      color: black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: .1);
  static TextStyle get text => const TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 18,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: black);
  static TextStyle get smallText => const TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 14,
      letterSpacing: 2,
      color: black);
  static TextStyle get warningText => const TextStyle( fontFamily: 'libreBaskerville',
      fontSize: 22, fontWeight: FontWeight.w400, color: white);



}