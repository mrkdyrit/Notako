import 'package:flutter/material.dart';

Widget backdrop({
  required double imageWidth,
  required double imageHeight,
}) {
  return Container(
    constraints: BoxConstraints(
      minHeight: imageHeight,
      minWidth: imageWidth,
    ),
    decoration: const BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.4)
    ),
  );
}