import 'package:ecommerce_shopping_app/consts/consts.dart';
import 'package:ecommerce_shopping_app/widgets/bgWidget.dart';
import 'package:ecommerce_shopping_app/widgets/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_shopping_app/views/category_screen/category_details.dart';

import '../../controllers/product_controller.dart';
import 'category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: categories.text.fontFamily(bold).white.make()
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200),
              itemBuilder: (context, index){
              return Column(
                children: [
                  Image.asset(categoriesImages[index],height: 120, width: 200, fit: BoxFit.cover,),
                  10.heightBox,
                  categoriesList[index].text.color(Colors.white).align(TextAlign.center).make(),
                ],
              ).box.color(Colors.lightBlue.shade900).rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {

                controller.getSubCategories(categoriesList[index]);
                Route route = MaterialPageRoute(builder: (context) => CategoryDetails(title: categoriesList[index]),);
                Navigator.push(context, route);
              });
              }
          ),
        ),
      )
    );
  }
}
