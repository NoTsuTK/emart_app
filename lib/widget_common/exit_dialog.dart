import 'package:emart_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/consts.dart';

Widget exitDialog(context) {
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
          const Divider(),
          "Are you sure you want to exit?"
              .text
              .size(16)
              .color(darkFontGrey)
              .make(),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ourButton(
                  color: pinkColor,
                  textColor: whiteColor,
                  title: "Yes",
                  onPressed: () {
                    SystemNavigator.pop();
                  }),
              ourButton(
                  color: pinkColor,
                  textColor: whiteColor,
                  title: "No",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          )
        ],
      ).box.color(lightGrey).padding(const EdgeInsets.all(12)).rounded.make());
}
