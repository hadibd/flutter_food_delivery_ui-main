import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search Food or Restaurant',
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                size: 30.0,
              ),
            )),
      ),
    );
  }
}
