import 'package:dailymeal/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../categories_list.dart';
class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(children: categoriesList.map((cCategory){
          return CategoryItem(title: cCategory.title,color: cCategory.color,id:cCategory.id);
        }).toList()
          ,gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20
          ),
          padding: EdgeInsets.all(25),
    );
  }

}