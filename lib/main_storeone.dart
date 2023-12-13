import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loyalty_wallet/constants/env/env.dart';
import 'package:loyalty_wallet/constants/stores/stores.dart';
import 'package:loyalty_wallet/features/my_app/my_app.dart';
import 'package:loyalty_wallet/services/data_storage/protocols/i_initialization_of_data_storage_service.dart';
import 'package:loyalty_wallet/services/env_services/env_resolver.dart';
import 'package:loyalty_wallet/services/env_services/models/store_from_env_model/store_from_env_model.dart';
import 'package:loyalty_wallet/services/service_locator/service_locator_setup.dart';
import 'package:path_provider/path_provider.dart';

import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.storeone;
  WidgetsFlutterBinding.ensureInitialized();
  final env = EnvResolver.resolveEnv();
  const StoreFromEnvModel selectedStore = Stores.storeOne;
  EnvResolver.currentStore = selectedStore;
  final String envFile = "${Env.envFile}.$env";

  await dotenv.load(fileName: envFile, mergeWith: {"STORE_ID": selectedStore.id.toString()});
  // get storage to make possible BloCs rehydration
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  configureDependencies("${env}_${selectedStore.nameEnv}");
  // this is for make it works the next line and localize the IInitializationOfDataStorageService instance
  final getIt = GetIt.instance;
  // init secure local storage (Hive)
  final initDataStorage = getIt<IInitializationOfDataStorageService>();
  // init hive configuration storage
  await initDataStorage.initializationOfDataStorageService();
  runApp(const ProviderScope(child: App()));
}
