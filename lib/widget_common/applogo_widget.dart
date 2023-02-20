import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget applogoWidget() {
  //using velcoity X here
  return Image.asset(icAppLogo)
      .box
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
