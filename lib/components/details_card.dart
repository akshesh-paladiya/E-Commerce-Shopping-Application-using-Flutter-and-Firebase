// import 'dart:js';

import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard({width, String? count, String? title}){
  return Column(
    children: [
      count!.text.fontFamily(bold).color(whiteColor).make(),
      5.heightBox,
      title!.text.fontFamily(bold).color(whiteColor).make()
    ],
  ).box.color(Colors.lightBlue.shade900).rounded.width(width).padding(const EdgeInsets.all(4)).make();
}