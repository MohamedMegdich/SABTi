import 'package:flutter/foundation.dart';

//enum Stock { Instock, Outstock }

class Product {
  final String id;
  final String title;
  final String image;
  final double quantite;
  final double prix;
  final String location;
  //final Stock stock;

  const Product({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.quantite,
    @required this.prix,
    @required this.location,
    //@required this.stock,
  });
}
