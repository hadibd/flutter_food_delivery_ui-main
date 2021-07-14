import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_bar.dart';

class NearByRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _restaurantsList() {
      List<Widget> restaurantList = [];
      restaurants.forEach((Restaurant restaurant) {
        Widget myRestaurant = GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RestaurantScreen(restaurant))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            height: 120.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey, width: 0.5)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    RatingBar(restaurant.rating),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      restaurant.address,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '0.5 mile away',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
        restaurantList.add(myRestaurant);
      });

      return Column(
        children: restaurantList,
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 5.0),
            child: Text(
              'Near By Restaurants',
              style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600),
            ),
          ),
          _restaurantsList(),
        ],
      ),
    );
  }
}
