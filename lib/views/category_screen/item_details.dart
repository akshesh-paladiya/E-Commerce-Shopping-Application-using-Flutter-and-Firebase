import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_app/services/firestore_service.dart';
import 'package:ecommerce_shopping_app/controllers/product_controller.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({Key? key, required this.title,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return WillPopScope(
      onWillPop: () async{
        // controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              // controller.resetValues();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
          backgroundColor: Colors.black,
          title: title!.text.color(Colors.white).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.share, color: Colors.white,)
            ),
            Obx(() => IconButton(
                onPressed: (){
                  if(controller.isFav.value){
                    controller.removeFromWishlist(data.Id,context);

                  }else{
                    controller.addToWishlist(data.Id,context);

                  }
                },
                icon: Icon(Icons.favorite_outlined,
                  color: controller.isFav.value ? redColor :Colors.white,
                )
            )
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VxSwiper.builder(
                          autoPlay: true,
                            height: 350,
                            itemCount:data['p_imgs'].length,
                            aspectRatio: 16 /9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index){
                            return Image.network(
                              data["p_imgs"][index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                            }),

                        10.heightBox,
                        title!.text.size(16).color(Colors.black).fontFamily(bold).make(),

                        // 10.heightBox,
                        // VxRating(
                        //   isSelectable: false,
                        //   value: double.parse(data['p_rating']),
                        //   onRatingUpdate: (value){},
                        //   normalColor: textfieldGrey,
                        //   selectionColor: golden,
                        //   count: 5,
                        //   size: 25,
                        //   stepInt: true,
                        // ),

                        10.heightBox,
                        "${data['p_price']}".numCurrency.text.color(Colors.black).size(14).fontFamily(bold).make(),

                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Description".text.color(Colors.lightBlue.shade800).fontFamily(bold).size(15).make(),

                                    5.heightBox,
                                    "${data['p_desc']}".text.color(Colors.lightBlue.shade900).fontFamily(semibold).size(10).make(),

                                  ],
                                )
                            ),
                            // const CircleAvatar(
                            //   backgroundColor: Colors.white,
                            //   child: Icon(Icons.message_rounded,color: darkFontGrey,),
                            // )
                          ],
                        ).box.height(155).padding(const EdgeInsets.symmetric(horizontal: 16)).color(Colors.blue.shade50,).make(),

                        20.heightBox,
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity ".text.color(Colors.black).make(),
                                ),
                               Obx(
                                       () =>  Row(
                                         children: [
                                           IconButton(onPressed: ()
                                           {
                                             controller.decreaseQuantity();
                                             controller.calculateTotalPrice(int.parse(data['p_price']));
                                           },
                                               icon: const Icon(Icons.remove)),
                                           controller.quantity.value.text.size(16).color(Colors.black).fontFamily(bold).make(),

                                           IconButton(onPressed: (){

                                             // controller.increaseQuantity(int.parse(data['p_quantity']));
                                             // controller.calculateTotalPrice(int.parse(data['p_price']));
                                           }, icon: const Icon(Icons.add)),

                                           10.widthBox,
                                           "(${data['p_quantity']} available)".text.color(darkFontGrey).make(),

                                         ],
                                       )
                               )
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Total ".text.color(Colors.black).make(),
                                ),
                              "${controller.totalPrice.value}".text.color(redColor).size(16).fontFamily(bold).make()
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),


                          ],
                        ).box.white.shadowSm.make(),


                      ],
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Button(

                color: Colors.lightBlue.shade900,
                onPress: (){
                  controller.addToCart(
                    // color: data['p_colors'][controller.colorIndex.value],
                    // context:context,
                    img: data['p_imgs'][0],
                    qty:controller.quantity.value,
                    title: data['p_name'],
                    tprice:controller.totalPrice.value
                  );
                  VxToast.show(context, msg: "Added To Cart");
                },
                textColor: whiteColor,
                title: "Add to Cart",
                
              ),
            )
          ],
        ),

      ),
    );
  }
}

