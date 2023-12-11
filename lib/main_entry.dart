import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loyalty_wallet/constants/env/env.dart';
import 'package:loyalty_wallet/services/env_services/env_resolver.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loyalty_wallet/services/env_services/models/store_from_env_model/store_from_env_model.dart';
import 'package:loyalty_wallet/services/service_locator/service_locator_setup.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final env = EnvResolver.resolveEnv();
  final selectedStore = EnvResolver.resolveStore();
  final String envFile = "${Env.envFile}.$env";

  await dotenv.load(fileName: ".$envFile", mergeWith: {"STORE_ID": selectedStore.id.toString()});
  // get storage to make possible BloCs rehydration
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  configureDependencies("${env}_${selectedStore.name}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreFromEnvModel? store = EnvResolver.currentStore;
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Text(store?.name ?? ""),
      ),
    );
  }
}

