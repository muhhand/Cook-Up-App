import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_Screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up!',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white,

            ),),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text('Meal',style: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text('Filters',style: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),

        ],
      ),
    );
  }
}
