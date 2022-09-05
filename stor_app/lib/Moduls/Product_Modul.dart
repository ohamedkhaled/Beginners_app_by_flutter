import 'package:flutter/cupertino.dart';

class ProductModul {
  final int id;
   final String title;
   final double price;
  final String description;
   final String category;
  final  String image;
  final Rating? rating;

  ProductModul(
      {required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        @required this.rating});

  factory ProductModul.fromJson(Map<String, dynamic> json) {
    return ProductModul(
    id : json['id'],
    title : json['title'],
     price : double.parse(json['price']),
     description : json['description'],
     category : json['category'],
     image : json['image'],
     rating : Rating.fromJson(json['rating'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count}) ;


  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
    rate :json['rate'],
    count : json['count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
