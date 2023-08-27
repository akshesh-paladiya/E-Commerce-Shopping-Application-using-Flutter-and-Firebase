import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/controllers/product_controller.dart';
import 'package:ecommerce_shopping_app/views/category_screen/item_details.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_shopping_app/widgets/loading_indicator.dart';
// import '../../functions/firebaseFunctions.dart';
import 'package:ecommerce_shopping_app/services/firestore_service.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.black.fontFamily(bold).make(),
        ),

        body:StreamBuilder(
          stream: FirestoreServices.getProducts(title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           if(!snapshot.hasData){
             return Center(
               child: loadingIndicator(),
             );
           }else if(snapshot.data!.docs.isEmpty){
             return Center(
               child: "No Product Found!".text.color(darkFontGrey).make(),
             );
           }else{
             var data = snapshot.data!.docs;
             return Container(
               padding: const EdgeInsets.all(12),
               child: Column(
                 children: [
                   SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: List.generate(controller.subcat.length,
                               (index) => "${controller.subcat[index]}".text.fontFamily(semibold).white.makeCentered().box.color(Colors.lightBlue.shade100,).rounded.size(150, 50).margin(const EdgeInsets.symmetric(horizontal: 4)).make()
                       ),
                     ),
                   ),

                   20.heightBox,
                   Expanded(
                       child: GridView.builder(
                           physics: const BouncingScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: data.length,
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, mainAxisExtent: 300, crossAxisSpacing: 8),
                           itemBuilder: (context, index){
                             return Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.network(data[index]['p_imgs'][0],width: 200, height:160,fit: BoxFit.cover),
                                 // const Spacer(),
                                 30.heightBox,
                                 "${data[index]['p_name']}".text.fontFamily(bold).color(Colors.black).make(),
                                 10.heightBox,
                                 "${data[index]['p_price']}".numCurrency.text.fontFamily(bold).color(Colors.black).make()
                               ],
                             ).box.margin(const EdgeInsets.symmetric(horizontal: 4)).color(Colors.blue.shade100,).rounded.padding(const EdgeInsets.all(8)).make().onTap(() {
                               controller.checkIfFav(data[index]);
                               Route route = MaterialPageRoute(builder: (context) => ItemDetails(title: "${data[index]['p_name']}", data: data[index],));
                               Navigator.push(context, route);
                             });
                           }
                       )

                   )

                 ],
               ),
             );
           }
            }
        )
      )
    );
  }
}
