// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/root/presentation/BLoC/fetch_store_bloc/fetch_store_bloc.dart'
    as _i3;
import '../../global/providers/app_settings_provider/app_settings_provider.dart'
    as _i15;
import '../../global/providers/app_settings_provider/app_settings_storage_manager/implementations/app_settings_storage_manager.dart'
    as _i14;
import '../../global/providers/app_settings_provider/app_settings_storage_manager/protocols/i_app_settings_storage_manager.dart'
    as _i13;
import '../../router/providers/navigator_keys_provider.dart' as _i12;
import '../../themes/protocols/i_color_schema.dart' as _i4;
import '../../themes/protocols/i_custom_colors_container.dart' as _i6;
import '../../themes/storeone/color_schemes.g.storeone.dart' as _i5;
import '../../themes/storeone/custom_color.g.storeone.dart' as _i7;
import '../data_storage/implementations/data_storage.dart' as _i9;
import '../data_storage/implementations/initialization_of_data_storage_service.dart'
    as _i11;
import '../data_storage/protocols/i_data_storage.dart' as _i8;
import '../data_storage/protocols/i_initialization_of_data_storage_service.dart'
    as _i10;

const String _production_store_one = 'production_store_one';
const String _staging_store_one = 'staging_store_one';
const String _local_store_one = 'local_store_one';
const String _test_store_one = 'test_store_one';

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
  gh.factory<_i3.FetchStoreBloc>(() => _i3.FetchStoreBloc());
  gh.factory<_i4.IColorSchema>(
    () => _i5.ColorSchemaStoreOne(),
    registerFor: {
      _production_store_one,
      _staging_store_one,
      _local_store_one,
      _test_store_one,
    },
  );
  gh.factory<_i6.ICustomColorsContainer>(
    () => _i7.CustomColorsContainerStoreOne(),
    registerFor: {
      _production_store_one,
      _staging_store_one,
      _local_store_one,
      _test_store_one,
    },
  );
  gh.factory<_i8.IDataStorage>(() => _i9.DataStorage());
  gh.factory<_i10.IInitializationOfDataStorageService<dynamic>>(
      () => _i11.InitializationOfDataStorageService());
  gh.factory<_i12.NavigatorKeysProvider>(() => _i12.NavigatorKeysProvider());
  gh.factory<_i13.IAppSettingsStorageManager>(() =>
      _i14.AppSettingsStorageManager(dataStorage: gh<_i8.IDataStorage>()));
  gh.factory<_i15.AppSettingsProvider>(() => _i15.AppSettingsProvider(
      appSettingsManager: gh<_i13.IAppSettingsStorageManager>()));
  return getIt;
}
