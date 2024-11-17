import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';

class InputDecorations {
  static InputDecoration inputTheme({
    required String hintText,
    required IconData prefixIcon,
    required Color borderColor,
    bool borderTop = true,
    String? errorText
  }){
    return InputDecoration(
      hintText: hintText,
      errorText: errorText,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor), // Border color
        borderRadius: borderTop ? BorderRadius.vertical(top: Radius.circular(6.0)) : BorderRadius.vertical(bottom: Radius.circular(6.0)) , // Rounded corners
      ),
      prefixIcon: Icon(
        prefixIcon, // Lock icon
        color: ColorManager.gray, // Icon color
      ),
    );
  }
}