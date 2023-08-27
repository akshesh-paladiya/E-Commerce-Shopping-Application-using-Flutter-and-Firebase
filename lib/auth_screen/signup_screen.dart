import 'package:ecommerce_shopping_app/consts/consts.dart';
// import 'package:ecom_app/controllers/auth_controller.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:ecommerce_shopping_app/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_shopping_app/widgets/button.dart';
import '../views/home_screen/home.dart';
import '../widgets/applogoWidget.dart';
import 'package:ecommerce_shopping_app/widgets/lists.dart';
import 'package:ecommerce_shopping_app/auth_screen/login_screen.dart';
// import 'package:ecom_app/consts/firebase_consts.dart';
import 'package:ecommerce_shopping_app/functions/authFunctions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // bool? isCheck = false;
  // // var controller = Get.put(AuthController());
  //
  // var nameController = TextEditingController();
  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // var passwordRetypeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;




  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.black,

          body: Form(
            key: _formKey,
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Signup in to $appname".text.fontFamily(bold).white.size(18).make(),
                10.heightBox,

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ======== Full Name ========
                    login
                        ? Container()
                        : TextFormField(
                      key: ValueKey('fullname'),
                      decoration: InputDecoration(
                        hintText: 'Enter Full Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Full Name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          fullname = value!;
                        });
                      },
                    ),

                    // ======== Email ========
                    TextFormField(
                      key: ValueKey('email'),
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                    // ======== Password ========
                    TextFormField(
                      key: ValueKey('password'),
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                      ),
                      obscureText: true,

                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Password of min length 6';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(

                          onPressed: () async {
                            Route route = MaterialPageRoute(builder: (context) => Home());
                            Navigator.push(context, route);
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              login
                                  ? AuthServices.signinUser(email, password, context)
                                  : AuthServices.signupUser(
                                  email, password, fullname, context);
                            }
                          },
                          child: Text(login ? 'Login' : 'Signup')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {

                          setState(() {
                            login = !login;
                          });
                        },
                        child: Text(login
                            ? "Don't have an account? Signup"
                            : "Already have an account? Login"))
                  ],
                ).box.black.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
              ],
            )
          ),


          // body: Center(
          //   child: Column(
          //     children: [
          //
          //       (context.screenHeight*0.1).heightBox,
          //       applogoWidget(),
          //       10.heightBox,
          //       "Signup in to $appname".text.fontFamily(bold).white.size(18).make(),
          //       10.heightBox,
          //       Column(
          //         children: [
          //           customTextField(hint: nameHint, title: name, controller: nameController, isPass: false,
          //
          //           ),
          //           customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
          //           customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
          //           customTextField(hint: passwordHint, title: retypepassword, controller: passwordRetypeController, isPass:true),
          //           Align(
          //             alignment: Alignment.centerRight,
          //             child: TextButton(onPressed: (){}, child: forgetPass.text.make(),),
          //
          //           ),
          //
          //          Row(
          //            children: [
          //
          //              Checkbox(
          //
          //                activeColor: Colors.white,
          //                checkColor: Colors.greenAccent,
          //                  value: isCheck,
          //                  onChanged: (newValue){
          //                  setState(() {
          //                    isCheck = newValue;
          //                  });
          //                  },
          //              ),
          //              10.widthBox,
          //              Expanded(
          //                  child: RichText(
          //                      text: const TextSpan(
          //                          children: [
          //                            TextSpan(
          //                              text: "I agree to the",
          //                              style: TextStyle(
          //                                fontFamily: bold,
          //                                color: fontGrey,
          //                              ),
          //                            ),
          //                            TextSpan(
          //                                text: termsAndCond,
          //                                style: TextStyle(
          //                                  fontFamily: bold,
          //                                  color: redColor,
          //                                )
          //                            ),
          //                            TextSpan(
          //                                text: "&",
          //                                style: TextStyle(
          //                                  fontFamily: bold,
          //                                  color: redColor,
          //                                )
          //                            ),
          //                            TextSpan(
          //                                text: privacyPolicy,
          //                                style: TextStyle(
          //                                  fontFamily: bold,
          //                                  color: redColor,
          //                                )
          //                            )
          //                          ]
          //                      )
          //                  )
          //              )
          //            ],
          //          ),
          //           5.heightBox,
          //           Button(color: isCheck == true? redColor : lightGrey,
          //               title: signup,
          //               textColor: whiteColor,
          //               onPress: () {},
          //
          //           ).box
          //               .width(context.screenWidth - 50)
          //               .make(),
          //
          //           10.heightBox,
          //           RichText(
          //               text: const TextSpan(
          //                 children:[
          //                   TextSpan(
          //                       text: alreadyHaveAccount,
          //                       style: TextStyle(
          //                         fontFamily: bold,
          //                         color: fontGrey,
          //                       )
          //                   ),
          //                   TextSpan(
          //                       text: login,
          //                       style: TextStyle(
          //                         fontFamily: bold,
          //                         color: redColor,
          //                       )
          //                   )
          //
          //                 ]
          //               )
          //           ).onTap(() {
          //             Route route = MaterialPageRoute(builder: (context) => LoginScreen());
          //             Navigator.push(context, route);
          //           }),
          //
          //         ],
          //       ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
          //     ],
          //   ),
          // ),
        ));
  }
}
// Route route = MaterialPageRoute(builder: (context) => LoginScreen());
// Navigator.push(context, route);