import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/features/placeSearch/presentation/manager/place_search_cubit.dart';

import '../manager/current_location_cubit.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  GoogleMapController? mapController ;
  void goToCurrentLocation(LatLng position){

    mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: position,
                zoom: 20
            )
        )
        );
        
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentLocationCubit, CurrentLocationState>(
      listener: (context, state) {
        if (state is CurrentLocationServiceDisabled) {
          showCupertinoDialog(
            context: context,
            builder: (dialogContext) {
              return CupertinoAlertDialog(
                title: const Text('Location is disabled'),
                content: const Text(
                  'Please enable location services in your device settings.',
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Open Settings'),
                    onPressed: () async {
                      Navigator.pop(dialogContext);
                      await context
                          .read<CurrentLocationCubit>()
                          .openLocationSettings();

                      if (!context.mounted) return;
                      context.read<CurrentLocationCubit>().getCurrentLocation();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
        builder: (context, state) {
          if (state is CurrentLocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CurrentLocationSuccess) {
            final currentLocation = state.currentLocationEntity;
             final markers = state.markers.map((marker) {
               return marker.copyWith(
                 onTapParam: () {
                   context.read<CurrentLocationCubit>().deleteMarker(marker.markerId);
                 }
               );
             },).toSet();


            return Stack(
              children :
              [      GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLocation.latitude,
                    currentLocation.longitude,
                  ),



                  zoom: 14.0,

                ),
                onMapCreated: (controller) {
                  mapController = controller;

                },
                onTap: (markerPosition) {

                  context.read<CurrentLocationCubit>().addMarker(markerPosition);

                },




                markers: markers,
              ),     Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(onPressed: ()
                {
                  goToCurrentLocation(LatLng(currentLocation.latitude, currentLocation.longitude));
                },
                  child: Icon(Icons.my_location),
                ),
              ),


                Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Material(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for a place',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (query) {
                      context.read<PlaceSearchCubit>().searchPlaces(query);
                    },
                  ),
                ),

              ),

                BlocBuilder<PlaceSearchCubit,PlaceSearchState>(
                  builder: (context, state) {

                    if (state is PlaceSearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PlaceSearchSuccess) {
                      final places = state.places;
                      return ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          final place = places[index];
                          return Material(
                            child: ListTile(
                              title: Text(place.name!),
                              subtitle: Text(place.address!),
                              onTap: () {
                                goToCurrentLocation(LatLng(place.latitude!, place.longitude!));
                                context.read<CurrentLocationCubit>().addMarker(LatLng(place.latitude!, place.longitude!));
                                context.read<PlaceSearchCubit>().clearSearchResults();
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is PlaceSearchError) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(state.errorMessage),
                        ),
                      );
                    }
                    return const SizedBox.shrink();

                  }, /**/
                ),




            ]
            );
          }

          if (state is CurrentLocationFailure) {
            return Center(child: Text(state.errorMessage));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

/*locBuilder<CurrentLocationCubit, CurrentLocationState>(
      builder: (context, state) {
        if (state is CurrentLocationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrentLocationSuccess) {
          final currentLocation = state.currentLocationEntity;
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 14.0,
            ),
          );
        } else if (state is CurrentLocationFailure) {
          return Center(child: Text(state.errorMessage));
        }else if (state is CurrentLocationServiceDisabled){
          return CupertinoAlertDialog(
            title: Text( "Location is disabled"),
            content: Text("Please enable location services in your device settings."),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                    Navigator.pop(context);
                    getIt<CurrentLocationCubit>().openLocationSettings();
                    if (context.mounted) {
                      context.read<CurrentLocationCubit>().getCurrentLocation();
                    }
                  }


              ),
            ],
          );
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );*/
