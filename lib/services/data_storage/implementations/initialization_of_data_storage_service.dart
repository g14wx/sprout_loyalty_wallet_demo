import 'package:hive_flutter/hive_flutter.dart';
// interfaces
import 'package:injectable/injectable.dart';
import 'package:loyalty_wallet/services/data_storage/protocols/i_initialization_of_data_storage_service.dart';

@Injectable(as: IInitializationOfDataStorageService)
class InitializationOfDataStorageService implements IInitializationOfDataStorageService {
  @override
  Future initializationOfDataStorageService() {
    return Hive.initFlutter();
  }
}
