import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_app/consts/consts.dart';
// import 'package:ecom_app/functions/firebaseFunctions.dart';
import 'package:ecommerce_shopping_app/widgets/featured_button.dart';
import 'package:ecommerce_shopping_app/widgets/home_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/painting/box_fit.dart';
import '../../widgets/lists.dart';
import 'package:ecommerce_shopping_app/services/firestore_service.dart';
import 'package:ecommerce_shopping_app/widgets/loading_indicator.dart';
//
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.lightBlue.shade100,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.black12,
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),

           10.heightBox,
            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 16/9,
                          autoPlay: true,
                          height: 130,
                          enlargeCenterPage: true,
                          itemCount: slidersList.length,
                          itemBuilder: (context, index){
                            return  Image.asset(slidersList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8),).make();

                          }),
                      // 10.heightBox,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: List.generate(2,
                      //           (index) => homeButtons(
                      //             height: context.screenHeight*0.15,
                      //             width: context.screenWidth / 2.5,
                      //             icon: index == 0?icTodaysDeal:icFlashDeal,
                      //             title: index == 0?todayDeal:flashsale,
                      //
                      //
                      //           )),
                      // ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3,
                                (index) => homeButtons(
                              height: context.screenHeight*0.15,
                              width: context.screenWidth / 3.5,
                              icon: index == 0?icTopCategories:index == 1?icBrands:icTopSeller,
                              title: index == 0?topCategories:index == 1?brand:topSellers,


                            )),
                      ),

                      20.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text.color(Colors.black).size(18).fontFamily(semibold).make(),
                      ),

                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                                  (index) => Column(
                                    children: [
                                      featuredButton(icon: featuredImages1[index], title: featuredTitles1[index]),
                                      10.heightBox,
                                      featuredButton(icon: featuredImages2[index], title: featuredTitles2[index]),
                                    ],
                                  )
                          ).toList(),
                        ),
                      ),

                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProduct.text.black.fontFamily(bold).size(18).make(),

                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                               child: FutureBuilder(
                                 future: FirestoreServices.getFeaturedProducts(),
                                 builder: (context, AsyncSnapshot<QuerySnapshot>snapshot)  {


                                   if(!snapshot.hasData){
                                     return Center(
                                     child: loadingIndicator(),

                                     );
                               }else if (snapshot.data!.docs.isEmpty){
                                     return "No featured products".text.makeCentered();
                               }else{
                                     var featuredData = snapshot.data!.docs;
                                     return Row(
                                         children: List.generate(
                                           featuredData.length,
                                               (index) => Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Image.network(featuredData[index]['p_imgs'][0],width: 150,fit: BoxFit.cover,),
                                               15.heightBox,
                                              "${featuredData[index]['p_name']}".text.fontFamily(bold).color(Colors.black).make(),
                                               10.heightBox,
                                               "${featuredData[index]['p_price']}".text.fontFamily(bold).color(Colors.black).make(),
                                             ],
                                           ).box.margin(const EdgeInsets.symmetric(horizontal: 4)) .color(Colors.blue.shade100,).rounded.padding(const EdgeInsets.all(8)).make(),
                                         )
                                     );
                                   }

                                 }
                               )
                            ),

                            // 20.heightBox,
                            // GridView.builder(
                            //   physics: const NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     itemCount: 6,
                            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, mainAxisExtent: 300),
                            //     itemBuilder: (context, index){
                            //     // return Column();
                            //     return Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Image.asset(imgP6,width: 200, height:200,fit: BoxFit.cover,),
                            //         const Spacer(),
                            //         10.heightBox,
                            //         "Laptop 4GB/ 64GB".text.fontFamily(bold).color(darkFontGrey).make()
                            //       ],
                            //     ).box.margin(const EdgeInsets.symmetric(horizontal: 4)) .white.rounded.padding(const EdgeInsets.all(8)).make();
                            //     }
                            // )



                          ],
                        )

                      )
                      




                    ],
                  ),
                ),
            ),

          ],
        ),),

    );
  }
}
