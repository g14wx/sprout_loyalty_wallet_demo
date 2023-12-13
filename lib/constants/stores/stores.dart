import 'package:loyalty_wallet/services/env_services/models/store_from_env_model/store_from_env_model.dart';

class Stores {
  // stores literals for build time
  static const String storeOneName = "store_one";
  static const String storeTwoName = "store_two";
  static const String storeThreeName = "store_three";
  static const StoreFromEnvModel storeOne = StoreFromEnvModel(name: "Store One", id: 1, nameEnv: storeOneName);
  static const StoreFromEnvModel storeTwo = StoreFromEnvModel(name: "Store Two", id: 2, nameEnv: storeTwoName);
  static const StoreFromEnvModel storeThree = StoreFromEnvModel(name: "Store Three", id: 3, nameEnv: storeThreeName);
}
