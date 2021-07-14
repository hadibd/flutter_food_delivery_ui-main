import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Recent Orders',
                style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 120.0,
              margin: EdgeInsets.only(right: 15.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: currentUser.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 350.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.grey, width: 0.5)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Hero(
                                tag: currentUser.orders[index].food.imageUrl,
                                child: Image(
                                  image: AssetImage(
                                      currentUser.orders[index].food.imageUrl),
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Container(
                              width: 100.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentUser.orders[index].food.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    currentUser.orders[index].food.price
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    currentUser.orders[index].date,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              width: 50.0,
                              margin: EdgeInsets.only(right: 10.0),
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
