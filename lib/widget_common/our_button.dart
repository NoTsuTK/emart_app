import 'package:flutter/material.dart';

Widget ourButton(
    {required color,
    required textColor,
    required title,
    required void Function()? onPressed}) {
  return MaterialButton(
    color: color,
    minWidth: double.infinity,
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(color: textColor),
    ),
  );
}
