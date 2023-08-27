import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/views/home_screen/home.dart';
import 'package:ecommerce_shopping_app/views/home_screen/home_screen.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:ecommerce_shopping_app/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_shopping_app/widgets/button.dart';
import '../widgets/applogoWidget.dart';
import 'package:ecommerce_shopping_app/widgets/lists.dart';
import 'package:ecommerce_shopping_app/auth_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    var controller;
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              children: [

                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
                10.heightBox,

              Column(
                        children: [
                          // customTextField(hint: emailHint, title: email, isPass: false, ),
                          // customTextField(hint: passwordHint, title: password, isPass: true, ),
                          Align(
                            alignment: Alignment.centerRight,
                            // child: TextButton( child: forgetPass.text.make(),),

                          ),


                          20.heightBox,
                          // controller.isloading.value
                          // ? const CircularProgressIndicator(
                          //   valueColor: AlwaysStoppedAnimation(redColor),
                          // ):
                          Button(color: redColor,title: login, textColor: whiteColor,
                              onPress: () {
                                Route route = MaterialPageRoute(builder: (context) => Home());
                                Navigator.push(context, route);
                              }
                            //   async{
                            //     var controller;
                            // controller.isloading(true);
                            //
                            // await controller.loginMethod(context:context).then((value){
                            //   if (value != null){
                            //     VxToast.show(context, msg: loggedin);
                            //     Route route = MaterialPageRoute(builder: (context) => Home());
                            //     Navigator.push(context, route);
                            //   }else{controller.isloading(false);}
                            // });
                            //   }
                          )
                              .box
                              .width(context.screenWidth - 50)
                              .make(),
                          10.heightBox,
                          createNewAccount.text.color(fontGrey).make(),
                          10.heightBox,
                          Button(color: lightGrey, title: signup,textColor: redColor,
                              onPress: (){
                                Route route = MaterialPageRoute(builder: (context) => SignupScreen());
                                Navigator.push(context, route);
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()),);

                                // var Get;
                                // Get.to(() => const SignupScreen());
                              }
                          )
                              .box.width(context.screenWidth - 50).make(),
                          5.heightBox,
                          loginWith.text.color(golden).make(),

                          5.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) =>Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                          )

                        ],
                      ).box.black.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),



              ],
            ),
          ),
        ));
  }
}




