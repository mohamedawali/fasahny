import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

ratingBar(double rates,double size) {
  return RatingBar.builder(
      initialRating: rates,
      ignoreGestures: true,
      itemSize: size,
      allowHalfRating: true,
      itemBuilder: (context, index) => Row(
        children: const [
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ],
      ),
      onRatingUpdate: (value) {});
}