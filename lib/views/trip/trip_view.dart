import 'package:flutter/material.dart';
import '../../views/trip/widgets/trip_activities.dart';
import '../../views/trip/widgets/trip_city_bar.dart';
import '../../models/city_model.dart';
import '../../models/trip_model.dart';

class TripView extends StatefulWidget {
  static const String routeName = "/trip";
  final Trip trip;
  final City city;
  TripView({this.trip, this.city});

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripCityBar(city: widget.city),
            TripActivities(activities: widget.trip.activities),
          ],
        ),
      ),
    );
  }
}