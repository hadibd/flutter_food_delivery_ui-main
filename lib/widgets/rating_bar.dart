import 'package:flutter/cupertino.dart';

class RatingBar extends StatelessWidget {
  RatingBar(this.rating);

  final int rating;

  @override
  Widget build(BuildContext context) {
    String star = '';
    for (int i = 0; i < rating; i++) {
      star += '⭐ ';
    }
    star.trim();
    return Text(
      star,
      style: TextStyle(fontSize: 15.0),
    );
  }
}
