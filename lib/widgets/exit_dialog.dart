import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are You Sure You Want to Exit?".text.size(16).color(darkFontGrey).make(),

        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              color: redColor,
              onPress: (){
                SystemNavigator.pop();
              },
              textColor: whiteColor,
              title: "Yes"
            ),

            Button(
                color: redColor,
                onPress: (){
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "No"
            )
          ],
        )
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).roundedSM.make()
  );
}