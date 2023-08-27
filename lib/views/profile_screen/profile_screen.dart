import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/controllers/profile_controller.dart';
import 'package:ecommerce_shopping_app/widgets/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_shopping_app/components/details_card.dart';
import 'package:ecommerce_shopping_app/components/edit_profile_screen.dart';

// import '../../functions/firebaseFunctions.dart';
import 'package:ecommerce_shopping_app/services/firestore_service.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());
    FirestoreServices.getCounts;

    return bgWidget(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              // padding: const EdgeInsets.all(8),
              child: Column(
                children: [

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child:  const Icon(Icons.edit, color: Colors.black,).onTap(() {
                  //       Route route = MaterialPageRoute(builder: (context) => EditProfileScreen());
                  //       Navigator.push(context, route);
                  //     }),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(imgS1, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),

                        10.widthBox,
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Dummy User".text.fontFamily(bold).black.make(),
                                "user@gmail.com".text.black.make()
                              ],
                            )
                        ),

                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                )
                            ),
                            onPressed: (){},
                            child: "Logout".text.fontFamily(semibold).black.make()
                        )
                      ],
                    ),
                  ),
                  
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(count: "00",title: "In Your Cart", width: context.screenWidth / 3.4),
                      detailsCard(count: "62",title: "In Your Wishlist", width: context.screenWidth / 3.4),
                      detailsCard(count: "74",title: "Your Order", width: context.screenWidth / 3.4),
                    ],
                  ),

                  20.heightBox,
                  ListView.separated(
                    shrinkWrap: true,
                      separatorBuilder: (context, index){
                        return const Divider(color: lightGrey,);
                      },
                      itemCount: profileButtonList.length,
                    itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          leading: Image.asset(profileButtonIcon[index],width: 22,),
                          title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        );
                    },
                  ).box.color(Colors.lightBlue.shade900).rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.make()


                ],
              ),
            ),
          ),
        )
    );
  }
}
