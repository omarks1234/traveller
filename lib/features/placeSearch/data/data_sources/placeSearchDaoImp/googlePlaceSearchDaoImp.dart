import 'package:injectable/injectable.dart';
import 'package:traveller/features/placeSearch/data/models/placeSearchResponseModel.dart';
import 'package:traveller/features/placeSearch/data/remote/placesApiService.dart';

import '../placeSearchDaoInt.dart';

@Injectable(as: PlaceSearchDaoInt)
class PlaceSearchDaoImp extends PlaceSearchDaoInt {
  PlacesApiService placesApiService;
  @factoryMethod
  PlaceSearchDaoImp(this.placesApiService);
  @override
  Future<PlaceSearchResponseModel> searchPlace(String query) async{

     final response = await placesApiService.searchPlaces({
       'textQuery': query,
     }
     );
      return response ;

  }
  // Implementation of the PlaceSearchDao interface for Google Places API
  // This class will handle the data fetching and processing from the Google Places API
}