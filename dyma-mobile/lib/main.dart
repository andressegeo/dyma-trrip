import 'package:flutter/material.dart';
import 'package:project_dyma_end/views/trip/trip_view.dart';
import './providers/trip_provider.dart';
import './views/trips/trips_view.dart';
import './providers/city_provider.dart';
import 'package:provider/provider.dart';
import 'providers/city_provider.dart';
import 'providers/city_provider.dart';
import 'views/404/not_found.dart';
import 'views/home/home_view.dart';
import 'views/city/city_view.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  @override
  _DymaTripState createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  final CityProvider cityProvider = CityProvider();

  @override
  void initState() {
    cityProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: cityProvider,
        ),
        ChangeNotifierProvider.value(
          value: TripProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // primarySwatch: Colors.red,
          // accentColor: Colors.green,
          appBarTheme: AppBarTheme(
            // definition d'un theme pour le texte dans nos AppBar
            // en copiant les memes valeurs d'autres features mais en modifiant juste le fontSize du texte
            textTheme: ThemeData.light().textTheme.copyWith(
                  // use headline6 instead title who's deprecated
                  headline6: TextStyle(fontSize: 30),
                ),
          ),
          // definition d'un textTheme generique(pas qu'à l'AppBAr)
          // Pour l'utiliser dans un composant, exploiter l'inheritedWidget qu'est theme
          // dans le widget enfant puis appeler la propriété headline6
          // Le texte de l'enfant aura donc la couleur Bleu

          // textTheme: ThemeData.light().textTheme.copyWith(
          //       headline6: TextStyle(
          //         color: Colors.blue,
          //         // fontSize: 30,
          //       ),
          //     ),
        ),
        debugShowCheckedModeBanner: false,
        // home: HomeView(),
        // initialRoute: "/city",
        // initialRoute permet de faire abstraction
        //  de la home ou de la route:"/" Si existe, elle sera la première route à checker
        routes: {
          // On ne peut à la fois utiliser la route / et la propriété ^^ home, il faut choisir
          HomeView.routeName: (_) => HomeView(),
          CityView.routeName: (_) => CityView(),
          TripsView.routeName: (_) => TripsView(),
          TripView.routeName: (_) => TripView()
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => NotFound(),
        ),
      ),
    );
  }
}