import 'package:flutter/material.dart';

class AppColors {
  // Replace the blue colors with green shades
  static const Color greenButton = Color(0xFF4CAF50); // A green button color
  static const Color greenText = Color(0xFF388E3C); // A green text color

  static const Color grayText = Color(0xFF5D5F65);
  static const Color whiteText = Color(0xFFEDEEEF);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color blackBG = Color(0xFF181A20);
  static const Color blackTextFild = Color(0xFF262A34);

  static const Color gold = Color(0xFFFFD700); // Gold
  static const Color silver = Color(0xFFC0C0C0); // Silver
  static const Color coolGrey = Color(0xFF8C8C8C); // Cool Grey
  static const Color darkBlue = Color(0xFF003366); // Dark Blue
  static const Color navy = Color(0xFF001F3F); // Navy
  static const Color teal = Color(0xFF008080); // Teal
  static const Color cyan = Color(0xFF00FFFF); // Cyan
  static const Color purple = Color(0xFF800080); // Purple

  // Adjust the gradient to fit the green-black theme, using darker green tones
  static const List<Color> gradient = [
    Color.fromRGBO(24, 26, 32, 1),
    Color.fromRGBO(24, 26, 32, 0.9),
    Color.fromRGBO(24, 26, 32, 0.8),
    Color.fromRGBO(24, 26, 32, 0.7),
    Color.fromRGBO(24, 26, 32, 0.6),
    Color.fromRGBO(24, 26, 32, 0.5),
    Color.fromRGBO(24, 26, 32, 0.4),
    Color.fromRGBO(24, 26, 32, 0.0),
    Color.fromRGBO(0, 0, 51, 1), // Dark Blue
    Color.fromRGBO(0, 0, 51, 0.9), // Slightly transparent Dark Blue
    Color.fromRGBO(0, 0, 51, 0.8), // More transparent Dark Blue
    Color.fromRGBO(0, 0, 51, 0.7), // Even more transparent Dark Blue
    Color.fromRGBO(0, 0, 51, 0.6), // Lighter Dark Blue
    Color.fromRGBO(0, 0, 51, 0.5), // Even lighter Dark Blue
    Color.fromRGBO(0, 0, 51, 0.4), // Very light Dark Blue
    Color.fromRGBO(0, 0, 51, 0.0), // Transparent
  ];
}
