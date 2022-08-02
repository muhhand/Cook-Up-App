import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

class categoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  categoryItem(this.id, this.title, this.color);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
    arguments: {
      'id' : id,
      'title': title,
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(left: 25,right: 50,bottom: 50,top: 50),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(color: Colors.white,fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                  ),),
                  RaisedButton(onPressed: () => SelectCategory(context),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('View',style: TextStyle(color: color),),
                  ),
                ],
              ),
          ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
