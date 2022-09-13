import 'package:flutter/material.dart';

class Cards {
  final String urlImage;
  final String text;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final bool? isWhiteColor;
  final double containerSize;
  final Widget? nextPage;

  Cards({
    required this.urlImage,
    required this.text,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.containerSize,
    this.nextPage,
    this.isWhiteColor = false,
  });
}
