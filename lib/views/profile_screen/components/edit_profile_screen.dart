import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.passwordController.text = data['password'];

    return bgWidget(
        child: Scaffold(
            appBar: AppBar(),
            body: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.profileImgPath.isEmpty
                      ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 150,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  ourButton(
                      color: pinkColor,
                      textColor: whiteColor,
                      title: "Change",
                      onPressed: () {
                        Get.find<ProfileController>().changeImage(context);
                      }),
                  20.heightBox,
                  const Divider(),
                  customTextField(
                      hint: nameHint,
                      title: name,
                      isPass: false,
                      controller: controller.nameController),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                      controller: controller.passwordController),
                  20.heightBox,
                  SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: pinkColor,
                        textColor: whiteColor,
                        title: "Save",
                        onPressed: () {}),
                  ),
                ],
              )
                  .box
                  .white
                  .shadowSm
                  .padding(const EdgeInsets.all(16))
                  .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                  .rounded
                  .make(),
            )));
  }
}
