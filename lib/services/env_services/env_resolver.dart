import 'package:loyalty_wallet/constants/env/env.dart';
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
    return const StoreFromEnvModel(name: "", id: 1);
  }

}
