import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Homepage()));
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/food_delivery.png'))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Petuk',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Food Delivery Service',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
