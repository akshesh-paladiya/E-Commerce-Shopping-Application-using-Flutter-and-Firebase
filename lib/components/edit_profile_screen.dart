
import 'dart:io';

import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/controllers/profile_controller.dart';
import 'package:ecommerce_shopping_app/main.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:ecommerce_shopping_app/widgets/button.dart';
import 'package:ecommerce_shopping_app/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              controller.profileImgPath.isEmpty
              ?Image.asset(imgS1, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
              :Image.file(File(controller.profileImgPath.value),
              width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),

              10.heightBox,

              Button(color: redColor, onPress: (){
                controller.changeImage(context);
              }, textColor: whiteColor,title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false, validator: (value) {  }, key: ValueKey('email'), onSaved: (value) {  }),
              customTextField(hint: password, title: password, isPass: true, validator: (value) {  }, key:ValueKey('password'), onSaved: (value) {  }),

              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child:Button(color: redColor, onPress: (){}, textColor: whiteColor,title: "Save") ,
              )

            ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50)).make(),
        ),
      )
    );
  }
}
