// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../API/api_service.dart' as _i3;
import '../services/connectivity_service.dart' as _i4;
import '../services/needed_utils.dart' as _i6;
import '../third_party/services.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService.create());
  gh.lazySingleton<_i4.ConnectivityService>(() => _i4.ConnectivityService());
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.singleton<_i6.NeededVariables>(_i6.NeededVariables());
  gh.lazySingleton<_i5.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  return getIt;
}

class _$ThirdPartyServicesModule extends _i7.ThirdPartyServicesModule {
  @override
  _i5.DialogService get dialogService => _i5.DialogService();

  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();

  @override
  _i5.SnackbarService get snackBarService => _i5.SnackbarService();
}
