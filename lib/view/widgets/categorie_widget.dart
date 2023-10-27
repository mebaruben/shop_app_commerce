import 'package:flutter/material.dart';
import 'package:shop_app_commerce/dataprovider/models/categorie.dart';

class CategorieWidget extends StatelessWidget {
  final List<Categorie> categories;
  const CategorieWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(height: 90,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
                Container(
                  height: 60,width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            categories[index].image,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 5,),
                Text(categories[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 20,),
          itemCount: categories.length),
    );
  }
}
