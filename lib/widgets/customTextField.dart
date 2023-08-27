import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? title,String?hint, controller, isPass, required String? Function(dynamic value) validator, required ValueKey<String> key, required Null Function(dynamic value) onSaved}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense:true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: redColor))
        ),
      )
    ],
  );
}