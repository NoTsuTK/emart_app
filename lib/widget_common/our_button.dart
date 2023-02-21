import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';

Widget ourButton(
    {required color,
    required textColor,
    required title,
    required void Function()? onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: textColor)));
}
