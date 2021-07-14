import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart(${currentUser.cart.length})',
          style: TextStyle(letterSpacing: .8),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if (index < currentUser.cart.length) {
                      return itemCart(index);
                    }
                    return itemCartLast();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.grey,
                      height: 0.8,
                    );
                  },
                  itemCount: currentUser.cart.length + 1),
            ),
          ),
          SizedBox(
            height: 70.0,
          )
        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, -1), blurRadius: 6.0)
            ]),
        child: Text(
          'CHECKOUT',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }

  Container itemCartLast() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estimate Delivery Time:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              Text(
                '25 min',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              Text(
                '\$250',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container itemCart(int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        image: AssetImage(
                          currentUser.cart[index].food.imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentUser.cart[index].food.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    currentUser.cart[index].restaurant.name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120.0,
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 0.5),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text('-',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                        ),
                        Text(currentUser.cart[index].quantity.toString(),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {},
                          child: Text('+',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              '\$${currentUser.cart[index].food.price * currentUser.cart[index].quantity}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
