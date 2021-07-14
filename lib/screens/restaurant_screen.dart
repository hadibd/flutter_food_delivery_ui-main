import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_bar.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen(this.restaurant);

  final Restaurant restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 180.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back,
                          size: 30.0, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text('0.5 mile away')
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                RatingBar(widget.restaurant.rating),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 120.0,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Reviews',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 120.0,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Contact',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(8.0),
                physics: BouncingScrollPhysics(),
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage(food.imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.black38.withOpacity(0.4),
                                    Colors.black45.withOpacity(0.4),
                                    Colors.black54.withOpacity(0.4),
                                    Colors.black87.withOpacity(0.4),
                                  ])),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                food.name,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                '\$${food.price}',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0)),
                            ))
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
