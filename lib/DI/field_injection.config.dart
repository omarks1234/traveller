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

import '../features/register/data/data_sources/imp/RegisterDaoFireImp.dart'
    as _i974;
import '../features/register/data/data_sources/registerDaoInt.dart' as _i496;
import '../features/register/data/repositories/registerRepoImp.dart' as _i229;
import '../features/register/domain/repositories/repoInt.dart' as _i451;
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
    gh.singleton<_i66.FireBaseServices>(() => _i66.FireBaseServices());
    gh.factory<_i496.RegisterDaoInt>(
      () => _i974.RegisterDaoFirebaseImp(gh<_i66.FireBaseServices>()),
    );
    gh.factory<_i451.RepoInt>(
      () => _i229.RegisterRepoImp(gh<_i496.RegisterDaoInt>()),
    );
    gh.factory<_i732.RegisterUseCase>(
      () => _i732.RegisterUseCase(gh<_i451.RepoInt>()),
    );
    gh.factory<_i493.SignInModelViewCubit>(
      () => _i493.SignInModelViewCubit(gh<_i732.RegisterUseCase>()),
    );
    return this;
  }
}
