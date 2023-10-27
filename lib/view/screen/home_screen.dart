import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop_app_commerce/dataprovider/models/categorie.dart';
import 'package:shop_app_commerce/dataprovider/models/product.dart';
import 'package:shop_app_commerce/view/utils/constant.dart';
import 'package:shop_app_commerce/view/widgets/categorie_widget.dart';
import 'package:shop_app_commerce/view/widgets/home_app_bar_widget.dart';
import 'package:shop_app_commerce/view/widgets/home_slide_widget.dart';
import 'package:shop_app_commerce/view/widgets/search_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(
                  height: 20,
                ),
                const SearchField(),
                const SizedBox(
                  height: 20,
                ),
                HomeSlide(
                    onChange: (value) {
                      setState(() {
                        currentSlide = value;
                      });
                    },
                    currentSlide: currentSlide),
                const SizedBox(
                  height: 20,
                ),
                CategorieWidget(categories: categories),
                const SizedBox(
                  height: 15,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Text(
                      "Special For you",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: (){}, child: const Text("See all"))
                  ],
                ),
                const SizedBox(height: 10,),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10, mainAxisSpacing: 20),
                    itemBuilder: (context,index){
                    return Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kcontentColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Image.asset(products[index].image,width: 100,height: 100,),
                              Text(products[index].title,style: const  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("\$${products[index].price}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                  Row(
                                    children: List.generate(products[index].colors.length,
                                            (cindex) =>
                                                Container(
                                                  height: 10,
                                                  width: 10,
                                                  margin: const EdgeInsets.only(right: 3),
                                                  decoration: BoxDecoration(
                                                  color: products[index].colors[cindex],
                                                  shape: BoxShape.circle,

                                                ),
                                                )
                                    )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration:const  BoxDecoration(
                                  color: kprimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(10)
                                  )
                                ),
                                child: const Icon(Ionicons.heart_outline,color: Colors.white,size: 18,),
                              ),
                            ),
                        )
                      ],
                    );
                    }, itemCount: products.length,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
