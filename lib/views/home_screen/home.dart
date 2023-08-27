import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/controllers/home_controller.dart';
import 'package:ecommerce_shopping_app/views/cart_screen/cart_screen.dart';
import 'package:ecommerce_shopping_app/views/category_screen/category_screen.dart';
import 'package:ecommerce_shopping_app/views/home_screen/home_screen.dart';
import 'package:ecommerce_shopping_app/views/profile_screen/profile_screen.dart';
import 'package:ecommerce_shopping_app/widgets/exit_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_shopping_app/controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // get Get => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {


    var controller = Get.put(HomeController());

    var navbarItem= [


      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26, color: Colors.white,), label: home,),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,color: Colors.white,), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,color: Colors.white,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,color: Colors.white,), label: account),
    ];

    var navBody =[
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),

    ];

    return WillPopScope(

      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },

      child: Scaffold(
          body: Column(
            children: [
              Obx(() =>  Expanded(child: navBody.elementAt(controller.currentNavIndex.value)),)
            ],
          ),
          bottomNavigationBar: Obx(
                () => BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedItemColor: Colors.white,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.lightBlue.shade900,
              items: navbarItem,
              onTap: (value){

                controller.currentNavIndex.value = value;
              },
            ),
          )
      ),
    );
  }


}
