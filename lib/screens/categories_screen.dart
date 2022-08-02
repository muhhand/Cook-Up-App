import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class categoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.orange.withOpacity(0.7),
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60,left: 10),
                    child: Column(
                      children: [
                        Text("Cooking Up!",style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("EverythingYouWant",style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  ),
                  Image.asset("assets/images/pizza.png",width: 130,),
                ],
              ),
             ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
              shrinkWrap: true,
              children:
              DUMMY_CATEGORIES.map((catData) =>
              categoryItem(catData.id,catData.title,catData.color),
              ).toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 5/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
