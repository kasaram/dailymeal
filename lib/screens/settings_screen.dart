import 'package:dailymeal/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SettingsScreen extends StatefulWidget {
  final Function setFilters;
  final currentFilters;
  SettingsScreen(this.currentFilters,this.setFilters);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Map<String,bool> newFilters;
  @override
  void initState() {
    // TODO: implement initState
    newFilters = widget.currentFilters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          InkWell(
            onTap: () {
                widget.setFilters(newFilters);
                Toast.show("Saved!!", context, duration: 2, gravity:  Toast.BOTTOM);
            },
            child: Container(
              width: 50,
              child:Icon(Icons.save) ,
            ),
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                'Adjust Your Meals',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SwitchListTile(
            title: Text("Vegetarian"),
            subtitle: Text("Only vegetarian meals are included"),
            value: newFilters['vegetarian'],
            onChanged: (newValue) {
              setState(() {
                newFilters['vegetarian'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text("Vegan"),
            subtitle: Text("Only vegan meals are included"),
            value: newFilters['vegan'],
            onChanged: (newValue) {
              setState(() {
                newFilters['vegan'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text("Gluten-Free"),
            subtitle: Text("Only Gluten-Free meals are included"),
            value: newFilters['gluten'],
            onChanged: (newValue) {
              setState(() {
                newFilters['gluten'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text("Lactose"),
            subtitle: Text("Only Lactose-Free meals are included"),
            value: newFilters['lactose'],
            onChanged: (newValue) {
              setState(() {
                newFilters['lactose'] = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}


