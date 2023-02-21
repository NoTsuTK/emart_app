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

    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                      ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : data['imageUrl'] != '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.network(
                              data['imageUrl'],
                              width: 150,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
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
                        controller.changeImage(context);
                      }),
                  20.heightBox,
                  const Divider(),
                  customTextField(
                      hint: nameHint,
                      title: name,
                      isPass: false,
                      controller: controller.nameController),
                  10.heightBox,
                  customTextField(
                      hint: passwordHint,
                      title: oldpass,
                      isPass: true,
                      controller: controller.oldpasswordController),
                  10.heightBox,
                  customTextField(
                      hint: passwordHint,
                      title: newpass,
                      isPass: true,
                      controller: controller.newpasswordController),
                  20.heightBox,
                  controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(pinkColor))
                      : SizedBox(
                          width: context.screenWidth - 60,
                          child: ourButton(
                              color: pinkColor,
                              textColor: whiteColor,
                              title: "Save",
                              onPressed: () async {
                                controller.isLoading(true);

                                if (controller
                                    .profileImgPath.value.isNotEmpty) {
                                  await controller.uploadProfileImage();
                                } else {
                                  controller.profileImageLink =
                                      data['imageUrl'];
                                }

                                if (data['password'] ==
                                    controller.oldpasswordController.text) {
                                  await controller.changeAuthPassword(
                                      email: data['email'],
                                      password:
                                          controller.oldpasswordController.text,
                                      newpassword: controller
                                          .newpasswordController.text);

                                  await controller.updateProfile(
                                      imageUrl: controller.profileImageLink,
                                      name: controller.nameController.text,
                                      password: controller
                                          .newpasswordController.text);
                                  // ignore: use_build_context_synchronously
                                  VxToast.show(context, msg: "Updated");
                                } else {
                                  // ignore: use_build_context_synchronously
                                  VxToast.show(context,
                                      msg: "Wrong old password");
                                  controller.isLoading(false);
                                }
                              }),
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
