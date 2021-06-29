import 'package:flutter/foundation.dart';

class Activity {
  String name;
  String image;
  String id;
  String city;
  double price;

  Activity({
    @required this.name,
    @required this.image,
    @required this.id,
    @required this.city,
    @required this.price,
  });
}
