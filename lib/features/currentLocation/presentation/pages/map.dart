import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/features/currentLocation/presentation/widgets/mapView.dart';

import '../../../placeSearch/presentation/manager/place_search_cubit.dart';
import '../manager/current_location_cubit.dart';

// create map screen with flutter map and add marker on tap and show the marker on the map

class MapScreen extends StatelessWidget {
  MapScreen();

  @override
  Widget build(BuildContext context) {
    /*return MultiBlocProvider(providers: [
      BlocProvider<CurrentLocationCubit>(
          create: (context) => getIt<CurrentLocationCubit>()..getCurrentLocation()),
      BlocProvider(
        create: (context) =>
            getIt<PlaceSearchCubit>(),
      ),
    ],
    child: MapView(),);
  }*/
    return Scaffold();
  }
}
