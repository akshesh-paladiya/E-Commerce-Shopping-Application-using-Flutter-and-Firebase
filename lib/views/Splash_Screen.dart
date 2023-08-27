import 'package:ecommerce_shopping_app/auth_screen/login_screen.dart';
import 'package:ecommerce_shopping_app/consts/colors.dart';
import 'package:ecommerce_shopping_app/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:async';
import 'package:ecommerce_shopping_app/widgets/applogoWidget.dart';
import '../auth_screen/login.dart';
import '../auth_screen/signup_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  // changeScreen(){
  //   Future.delayed(const Duration(seconds: 3),(){
  //
  //     auth.authStateChanges().listen((User? user) {
  //       if(user == null && mounted){
  //         Get.to(() => const LoginScreen());
  //       }else{
  //         Get.to(() => const Home());
  //       }
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login_Page(),
            )
        )
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue.shade900,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg,width: 300,),),
            20.heightBox,
            applogoWidget(),
            // 10.heightBox,
            // appname.text.fontFamily(bold).size(22).white.make(),
            // 5.heightBox,
            // appversion.text.white.make(),
            // const Spacer(),
            // credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}

Widget applogoWidget(){

  return Image.asset('assets/images/cartify.png').box.black.size(130,130).padding(const EdgeInsets.all(8)).rounded.make();

}


