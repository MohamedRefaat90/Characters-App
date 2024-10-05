import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String image;
  final Color color;
  final void Function()? press;

  CategoryModel(
      {required this.name,
      required this.image,
      required this.color,
      required this.press});
}
