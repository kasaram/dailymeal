import 'package:dailymeal/model/meals.dart';
import 'package:dailymeal/widgets/favourite_meal_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.favouriteMeal.isEmpty
          ?Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
           child:Image.asset('assets/emptylist.png',color: Colors.grey.withOpacity(0.3),)
          ),
          Text(
            "No Favourites Yet!!",
            style: TextStyle(fontSize: 25,fontFamily: "Raleway",color: Colors.grey.withOpacity(0.3)),
          )
        ],
      )
          : ListView.builder(
              itemBuilder: (context, index) {
                return FavouriteMeal(
                  id: widget.favouriteMeal[index].id,
                  title: widget.favouriteMeal[index].title,
                  imageUrl: widget.favouriteMeal[index].imageUrl,
                  affordability: widget.favouriteMeal[index].affordability,
                  complexity: widget.favouriteMeal[index].complexity,
                  duration: widget.favouriteMeal[index].duration,
                );
              },
              itemCount: widget.favouriteMeal.length,
            ),
    );
  }
}
