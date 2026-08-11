// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
import '../features/login/data/data_sources/imp/loginFirebaseImp.dart' as _i871;
import '../features/login/data/data_sources/loginDaoInt.dart' as _i708;
import '../features/login/data/repositories/loginRepoImp.dart' as _i198;
import '../features/login/domain/repositories/loginRepoInt.dart' as _i473;
import '../features/login/domain/use_cases/loginUsecase.dart' as _i912;
import '../features/login/presentation/manager/login_cubit.dart' as _i315;
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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i51.GeolocatorService>(() => _i51.GeolocatorService());
    gh.singleton<_i66.FireBaseServices>(() => _i66.FireBaseServices());
    gh.factory<_i117.DaoIntCurrentLoc>(
      () => _i1041.DaoCurrentLocImp(gh<_i51.GeolocatorService>()),
    );
    gh.factory<_i718.AddUserDao>(
      () => _i707.AddUserFirebaseImp(gh<_i66.FireBaseServices>()),
    );
    gh.factory<_i496.RegisterDaoInt>(
      () => _i974.RegisterDaoFirebaseImp(gh<_i66.FireBaseServices>()),
    );
    gh.factory<_i708.LoginDaoInt>(
      () => _i871.LoginFirebaseImp(gh<_i66.FireBaseServices>()),
    );
    gh.factory<_i283.AddUserUseCase>(
      () => _i283.AddUserUseCase(gh<_i718.AddUserDao>()),
    );
    gh.factory<_i175.RepoAddUserInt>(
      () => _i828.RepoAddUserImp(gh<_i718.AddUserDao>()),
    );
    gh.factory<_i473.LoginRepoInt>(
      () => _i198.LoginRepoImp(gh<_i708.LoginDaoInt>()),
    );
    gh.factory<_i368.CurrentLocationRepo>(
      () => _i263.CurrentLocRepImp(gh<_i117.DaoIntCurrentLoc>()),
    );
    gh.factory<_i451.RepoInt>(
      () => _i229.RegisterRepoImp(gh<_i496.RegisterDaoInt>()),
    );
    gh.factory<_i478.CurrentLocUseCase>(
      () => _i478.CurrentLocUseCase(gh<_i368.CurrentLocationRepo>()),
    );
    gh.factory<_i166.Openlocationsettingsusecase>(
      () => _i166.Openlocationsettingsusecase(gh<_i368.CurrentLocationRepo>()),
    );
    gh.factory<_i912.LoginUseCase>(
      () => _i912.LoginUseCase(gh<_i473.LoginRepoInt>()),
    );
    gh.factory<_i732.RegisterUseCase>(
      () => _i732.RegisterUseCase(gh<_i451.RepoInt>()),
    );
    gh.factory<_i877.CurrentLocationCubit>(
      () => _i877.CurrentLocationCubit(
        gh<_i478.CurrentLocUseCase>(),
        gh<_i166.Openlocationsettingsusecase>(),
      ),
    );
    gh.factory<_i315.LoginCubit>(
      () => _i315.LoginCubit(gh<_i912.LoginUseCase>()),
    );
    gh.factory<_i493.SignInModelViewCubit>(
      () => _i493.SignInModelViewCubit(
        gh<_i732.RegisterUseCase>(),
        gh<_i283.AddUserUseCase>(),
      ),
    );
    return this;
  }
}
