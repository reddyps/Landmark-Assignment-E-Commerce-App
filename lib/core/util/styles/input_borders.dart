import 'package:flutter/material.dart';

mixin InputBorders{
  outlineInputBorder(){
    return OutlineInputBorder(
        borderSide:
        const BorderSide(width: 1, color: Colors.black38),
        borderRadius: BorderRadius.circular(12));
  }

  outlineFocusedInputBorder(){
    return OutlineInputBorder(
        borderSide:
        const BorderSide(width: 1, color: Color(0xFF020607)),
        borderRadius: BorderRadius.circular(12));
  }

  outlineErrorBorder(){
    return OutlineInputBorder(
        borderSide:
        const BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(12));
  }
}