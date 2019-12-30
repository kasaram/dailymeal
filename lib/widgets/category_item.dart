import 'package:dailymeal/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  final String title;
  final Color color;
  final String id;
  CategoryItem({this.title,this.color,this.id});

  void selectCategory(BuildContext context,String title){
    Navigator.of(context).pushNamed('/meals_screen',arguments:{
      'id':id,
      'title':title,
    } );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[color.withOpacity(0.7),color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: (){
            selectCategory(context,title);
          },
          child: Card(
            elevation: 6,
            child:Center(child: Text(title,style: TextStyle(fontFamily: 'Raleway',fontSize: 20),),) ,
          ),
        ),
    );
  }

}