// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/dioModule.dart' as _i395;
import '../core/resources/services/geolocator.dart' as _i51;
import '../features/currentLocation/data/data_sources/DaoCurrentLocImp.dart'
    as _i1041;
import '../features/currentLocation/data/data_sources/DaoInt/DaoIntCurrentLoc.dart'
    as _i117;
import '../features/currentLocation/data/repositories/currentLocRepImp.dart'
    as _i263;
import '../features/currentLocation/domain/repositories/currentLocationRepo.dart'
    as _i368;
import '../features/currentLocation/domain/use_cases/currentLocUseCase.dart'
    as _i478;
import '../features/currentLocation/domain/use_cases/openLocationSettingsUseCase.dart'
    as _i166;
import '../features/currentLocation/presentation/manager/current_location_cubit.dart'
    as _i877;
import '../features/generatedTrip/data/data_sources/aiTripService.dart'
    as _i124;
import '../features/generatedTrip/data/data_sources/GeneratedTripDao.dart'
    as _i312;
import '../features/generatedTrip/data/data_sources/generatedTripImp/generatedTripGeminiImp.dart'
    as _i412;
import '../features/generatedTrip/data/repositories/generatedTripRepoImP.dart'
    as _i194;
import '../features/generatedTrip/domain/repositories/generatedTripRepoInt.dart'
    as _i771;
import '../features/generatedTrip/domain/use_cases/generatedTripUsecase.dart'
    as _i950;
import '../features/generatedTrip/domain/use_cases/getTripByIdUseCase.dart'
    as _i8;
import '../features/generatedTrip/presentation/manager/generated_trip_cubit.dart'
    as _i895;
import '../features/login/data/data_sources/imp/loginFirebaseImp.dart' as _i871;
import '../features/login/data/data_sources/loginDaoInt.dart' as _i708;
import '../features/login/data/repositories/loginRepoImp.dart' as _i198;
import '../features/login/domain/repositories/loginRepoInt.dart' as _i473;
import '../features/login/domain/use_cases/loginUsecase.dart' as _i912;
import '../features/login/presentation/manager/login_cubit.dart' as _i315;
import '../features/placeSearch/data/data_sources/placeSearchDaoImp/googlePlaceSearchDaoImp.dart'
    as _i303;
import '../features/placeSearch/data/data_sources/placeSearchDaoInt.dart'
    as _i858;
import '../features/placeSearch/data/remote/placesApiService.dart' as _i543;
import '../features/placeSearch/data/repositories/PlaceSearchReopImp.dart'
    as _i771;
import '../features/placeSearch/domain/repositories/placeSearchRepo.dart'
    as _i897;
import '../features/placeSearch/domain/use_cases/placeSearchUseCase.dart'
    as _i128;
import '../features/placeSearch/presentation/manager/place_search_cubit.dart'
    as _i942;
import '../features/register/data/data_sources/addUserDao.dart' as _i718;
import '../features/register/data/data_sources/imp/addUserFirebaseImp.dart'
    as _i707;
import '../features/register/data/data_sources/imp/RegisterDaoFireImp.dart'
    as _i974;
import '../features/register/data/data_sources/registerDaoInt.dart' as _i496;
import '../features/register/data/repositories/registerRepoImp.dart' as _i229;
import '../features/register/data/repositories/repoAddUserImp.dart' as _i828;
import '../features/register/domain/repositories/repoAdduUserInt.dart' as _i175;
import '../features/register/domain/repositories/repoInt.dart' as _i451;
import '../features/register/domain/use_cases/addUserCase.dart' as _i283;
import '../features/register/domain/use_cases/register_useCase.dart' as _i732;
import '../features/register/firebase_services.dart' as _i66;
import '../features/register/presentation/manager/sign_in_model_view_cubit.dart'
    as _i493;
import '../features/savePreferences/data/data_sources/imp/SavePreferenceFirestoreImp.dart'
    as _i18;
import '../features/savePreferences/data/data_sources/SavePreferenceDaoInt.dart'
    as _i623;
import '../features/savePreferences/data/repositories/savePreferencesRepoImp.dart'
    as _i546;
import '../features/savePreferences/data/service/fireStoreSavingPreferences.dart'
    as _i683;
import '../features/savePreferences/domain/repositories/preferenceRepoInt.dart'
    as _i562;
import '../features/savePreferences/domain/use_cases/chooseExperienceUseCase.dart'
    as _i146;
import '../features/savePreferences/domain/use_cases/createTripUsecase.dart'
    as _i1052;
import '../features/savePreferences/domain/use_cases/savePreferencesUseCase.dart'
    as _i923;
import '../features/savePreferences/presentation/manager/choose_experience_cubit.dart'
    as _i872;
import '../features/savePreferences/presentation/manager/create_trip_cubit.dart'
    as _i613;
import '../features/savePreferences/presentation/manager/save_preferences_cubit.dart'
    as _i780;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.getDio());
    gh.singleton<_i51.GeolocatorService>(() => _i51.GeolocatorService());
    gh.singleton<_i124.AiTripService>(() => _i124.AiTripService());
    gh.singleton<_i412.SaveGeneratedItinerary>(
        () => _i412.SaveGeneratedItinerary());
    gh.singleton<_i66.FireBaseServices>(() => _i66.FireBaseServices());
    gh.singleton<_i543.PlacesApiService>(
        () => dioModule.getPlacesApiService(gh<_i361.Dio>()));
    gh.factory<_i117.DaoIntCurrentLoc>(
        () => _i1041.DaoCurrentLocImp(gh<_i51.GeolocatorService>()));
    gh.factory<_i312.GeneratedTripDao>(() => _i412.GeneratedTripGeminiImp(
          gh<_i124.AiTripService>(),
          gh<_i412.SaveGeneratedItinerary>(),
          gh<_i66.FireBaseServices>(),
        ));
    gh.factory<_i718.AddUserDao>(
        () => _i707.AddUserFirebaseImp(gh<_i66.FireBaseServices>()));
    gh.factory<_i496.RegisterDaoInt>(
        () => _i974.RegisterDaoFirebaseImp(gh<_i66.FireBaseServices>()));
    gh.factory<_i708.LoginDaoInt>(
        () => _i871.LoginFirebaseImp(gh<_i66.FireBaseServices>()));
    gh.singleton<_i683.FireStoreSavingPreferences>(
        () => _i683.FireStoreSavingPreferences(gh<_i66.FireBaseServices>()));
    gh.factory<_i858.PlaceSearchDaoInt>(
        () => _i303.PlaceSearchDaoImp(gh<_i543.PlacesApiService>()));
    gh.factory<_i771.GeneratedTripRepoInt>(
        () => _i194.GeneratedTripRepoImp(gh<_i312.GeneratedTripDao>()));
    gh.factory<_i950.GeneratedTripUseCase>(
        () => _i950.GeneratedTripUseCase(gh<_i771.GeneratedTripRepoInt>()));
    gh.factory<_i8.GetTripByIdUseCase>(
        () => _i8.GetTripByIdUseCase(gh<_i771.GeneratedTripRepoInt>()));
    gh.factory<_i283.AddUserUseCase>(
        () => _i283.AddUserUseCase(gh<_i718.AddUserDao>()));
    gh.factory<_i175.RepoAddUserInt>(
        () => _i828.RepoAddUserImp(gh<_i718.AddUserDao>()));
    gh.factory<_i473.LoginRepoInt>(
        () => _i198.LoginRepoImp(gh<_i708.LoginDaoInt>()));
    gh.factory<_i368.CurrentLocationRepo>(
        () => _i263.CurrentLocRepImp(gh<_i117.DaoIntCurrentLoc>()));
    gh.factory<_i451.RepoInt>(
        () => _i229.RegisterRepoImp(gh<_i496.RegisterDaoInt>()));
    gh.factory<_i895.GeneratedTripCubit>(() => _i895.GeneratedTripCubit(
          gh<_i950.GeneratedTripUseCase>(),
          gh<_i8.GetTripByIdUseCase>(),
        ));
    gh.factory<_i623.SavePreferenceDaoInt>(() =>
        _i18.SavePreferenceFirestoreImp(
            gh<_i683.FireStoreSavingPreferences>()));
    gh.factory<_i478.CurrentLocUseCase>(
        () => _i478.CurrentLocUseCase(gh<_i368.CurrentLocationRepo>()));
    gh.factory<_i897.PlaceSearchRepo>(
        () => _i771.PlaceSearchRepoImp(gh<_i858.PlaceSearchDaoInt>()));
    gh.factory<_i166.Openlocationsettingsusecase>(() =>
        _i166.Openlocationsettingsusecase(gh<_i368.CurrentLocationRepo>()));
    gh.factory<_i128.PlaceSearchUseCase>(
        () => _i128.PlaceSearchUseCase(gh<_i897.PlaceSearchRepo>()));
    gh.factory<_i562.PreferenceRepoInt>(
        () => _i546.SavePreferencesRepoImp(gh<_i623.SavePreferenceDaoInt>()));
    gh.factory<_i146.ChooseExperienceUseCase>(
        () => _i146.ChooseExperienceUseCase(gh<_i562.PreferenceRepoInt>()));
    gh.factory<_i1052.CreateTripUseCase>(
        () => _i1052.CreateTripUseCase(gh<_i562.PreferenceRepoInt>()));
    gh.factory<_i923.SavePreferencesUseCase>(
        () => _i923.SavePreferencesUseCase(gh<_i562.PreferenceRepoInt>()));
    gh.factory<_i942.PlaceSearchCubit>(
        () => _i942.PlaceSearchCubit(gh<_i128.PlaceSearchUseCase>()));
    gh.factory<_i912.LoginUseCase>(
        () => _i912.LoginUseCase(gh<_i473.LoginRepoInt>()));
    gh.factory<_i732.RegisterUseCase>(
        () => _i732.RegisterUseCase(gh<_i451.RepoInt>()));
    gh.factory<_i877.CurrentLocationCubit>(() => _i877.CurrentLocationCubit(
          gh<_i478.CurrentLocUseCase>(),
          gh<_i166.Openlocationsettingsusecase>(),
        ));
    gh.factory<_i315.LoginCubit>(
        () => _i315.LoginCubit(gh<_i912.LoginUseCase>()));
    gh.factory<_i872.ChooseExperienceCubit>(
        () => _i872.ChooseExperienceCubit(gh<_i146.ChooseExperienceUseCase>()));
    gh.factory<_i780.SavePreferencesCubit>(
        () => _i780.SavePreferencesCubit(gh<_i923.SavePreferencesUseCase>()));
    gh.factory<_i613.CreateTripCubit>(
        () => _i613.CreateTripCubit(gh<_i1052.CreateTripUseCase>()));
    gh.factory<_i493.SignInModelViewCubit>(() => _i493.SignInModelViewCubit(
          gh<_i732.RegisterUseCase>(),
          gh<_i283.AddUserUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i395.DioModule {}
