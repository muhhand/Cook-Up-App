import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/main.dart';

class FiltersScreen extends StatefulWidget {

static const routeName = "/filters";

final Function saveFilters;
final Map<String,bool> currentFilters;

 FiltersScreen( this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
 bool _glutenFree = false;

 bool _lactoseFree = false;

 bool _vegan = false;

 bool _vegetarian = false;


@override
void initState() {
  _glutenFree = widget.currentFilters['gluten'];

  _lactoseFree = widget.currentFilters['lactose'];

  _vegan = widget.currentFilters['vegan'];

  _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters',style : TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        actions: [
          IconButton(
              onPressed:(){
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
                } ,
              icon: Icon(Icons.save))
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.titleLarge,),
          ),
          Expanded(
              child:ListView(
                children: [
                  SwitchListTile(
                    title: Text('Gluten Free',),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten free meals'),
                    onChanged: (newValue){
                      setState((){
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose Free',),
                    value: _lactoseFree,
                    subtitle: Text('Only include lactose free meals'),
                    onChanged: (newValue){
                      setState((){
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian',),
                    value: _vegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (newValue){
                      setState((){
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan',),
                    value: _vegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (newValue){
                      setState((){
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
