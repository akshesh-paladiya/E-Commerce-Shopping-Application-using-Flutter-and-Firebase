import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/controllers/cart_controller.dart';
// import 'package:ecom_app/functions/firebaseFunctions.dart';
import 'package:ecommerce_shopping_app/functions/firebase_consts.dart';
import 'package:ecommerce_shopping_app/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ecommerce_shopping_app/controllers/product_controller.dart';
import 'package:ecommerce_shopping_app/controllers/cart_controller.dart';
import 'package:ecommerce_shopping_app/services/firestore_service.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/button.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // var controller = Get.find<ProductController>();
    var controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: "Shopping Cart".text.color(Colors.white).fontFamily(semibold).make(),
      ),
     body: StreamBuilder(
         stream: FirestoreServices.getCart(currentUser!.uid),
         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

           if(!snapshot.hasData){
             return Center(
               child: loadingIndicator(),
             );
           } else if (snapshot.data!.docs.isEmpty){
             return Center(
               child: "Cart is Empty".text.color(darkFontGrey).make(),
             );
           }else{

             var data = snapshot.data!.docs;
             controller.calculate(data);
             return Padding(
               padding: const EdgeInsets.all(8),
               child: Column(
                 children: [
                   Expanded(
                     child: ListView.builder(
                         itemCount: data.length,
                         itemBuilder: (BuildContext context, int index){
                           return ListTile(
                               leading: Image.network("${data[index]['img']}"),
                               title: "${data[index]['title']}".text.fontFamily(semibold).size(16).make(),
                               subtitle: "${data[index]['tprice']}".text.color(Colors.red).fontFamily(semibold).size(16).make(),
                               trailing: const Icon(Icons.delete,color: redColor,).onTap(() {
                                 FirestoreServices.deleteDocument(data[index].id);
                               })

                           );
                         }
                     ),
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       "Total Price".text.fontFamily(semibold).color(darkFontGrey).make(),
                       Obx(()=> "${controller.totalP.value}".text.fontFamily(semibold).color(darkFontGrey).make())
                     ],
                   ).box.padding(EdgeInsets.all(12)).color(lightGolden).width(context.screenWidth - 60).roundedSM.make(),

                   10.heightBox,
                   SizedBox(
                     width: context.screenWidth - 60,
                     child: Button(
                         color: redColor,
                         onPress: (){},
                         textColor: whiteColor,
                         title: "Process to Shipping"
                     ),
                   )
                 ],
               ),
             );
          }
         }
     )
    );
  }
}
