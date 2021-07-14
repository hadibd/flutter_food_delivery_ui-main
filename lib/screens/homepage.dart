import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/splash_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/near_by_restaurents.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import 'package:flutter_food_delivery_ui/widgets/search_bar.dart';

import '../data/data.dart';
import 'cart_screen.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Petuk Service'),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => SplashScreen())),
          child: Icon(
            Icons.account_circle_outlined,
            size: 30.0,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen())),
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    size: 30.0,
                  ),
                  Text(
                    '(${currentUser.cart.length})',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [SearchBar(), RecentOrders(), NearByRestaurants()],
      ),
    );
  }
}
