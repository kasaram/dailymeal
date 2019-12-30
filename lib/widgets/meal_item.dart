
import 'package:dailymeal/model/meals.dart';
import 'package:flutter/material.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final duration;
  final complexity;
  final affordability;
  final Function removeItem;
  MealItem({this.id,this.title,this.imageUrl,this.duration,this.complexity,this.affordability,this.removeItem});

  String get complexityText{
    if(complexity==Complexity.Simple){
      return 'Simple';

    }else if(complexity==Complexity.Challenging){
      return 'Challenging';

    }else if(complexity==Complexity.Hard){
      return 'Hard';
    }
    return 'Unknown';
  }

  String get affordabilityText{
    if(affordability==Affordability.Affordable){
      return 'Affordable';

    }else if(affordability==Affordability.Luxurious){
      return 'Luxurious';

    }else if(affordability==Affordability.Pricey){
      return 'Pricey';
    }
    return 'Unknown';
  }
  void selectMeal(BuildContext context) {
        Navigator.of(context).pushNamed('/recipes_screen',arguments: {
          'id':id,
          'title':title,
          'imageUrl':imageUrl,
        }).then((result){
          if(result!=null){
            removeItem(result);
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      splashColor: Theme.of(context).accentColor,
      child: Card(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
        margin: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  left: 50,
                  bottom: 20,
                  right: 10,
                  child:Container(
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  child:  Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                            softWrap: true,
                          ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 5,),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 5,),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 5,),
                    Text(affordabilityText)
                  ],
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
