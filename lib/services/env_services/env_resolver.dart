import 'package:loyalty_wallet/constants/env/env.dart';
import 'package:loyalty_wallet/constants/stores/stores.dart';
import 'package:loyalty_wallet/services/env_services/models/store_from_env_model/store_from_env_model.dart';

class EnvResolver {

  static String? currentEnv;
  static StoreFromEnvModel? currentStore;
  static String resolveEnv() {
    const envFromCLi = String.fromEnvironment("ENV");
    // Default env will be local
    String env = Env.local;
    if (envFromCLi.isNotEmpty) {
      switch (envFromCLi) {
        case Env.production:
          env = envFromCLi;
          break;
        case Env.staging:
          env = Env.staging;
          break;
      }
    }
    currentEnv = env;
    return env;
  }

  static StoreFromEnvModel resolveStore() {
    const storeIdFromEnv = String.fromEnvironment("STORE_ID");
    // Default env will be local
    StoreFromEnvModel envStore = Stores.storeOne;
    if (storeIdFromEnv.isNotEmpty) {
      switch (storeIdFromEnv) {
        case "1":
          currentStore = Stores.storeOne;
          break;
        case "2":
          currentStore = Stores.storeTwo;
          break;
      }
    }
    currentStore = envStore;
    return envStore;
  }

}
