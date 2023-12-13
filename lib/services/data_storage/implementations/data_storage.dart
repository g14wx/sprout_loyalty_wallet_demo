import 'dart:convert';
// packages
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:loyalty_wallet/constants/config/storage_keys.dart';
import 'package:loyalty_wallet/services/data_storage/protocols/i_data_storage.dart';

@Injectable(as: IDataStorage)
class DataStorage implements IDataStorage {
  @override
  Future<Either<Exception, dynamic>> getData({required String service, required String key}) async {
    late Box box;
    if (Hive.isBoxOpen(service)) {
      box = Hive.box(service);
    } else {
      box = await Hive.openBox(service);
    }
    final value = box.get(key);
    if (value != null) {
      return Right(value);
    } else {
      return Left(Exception("Can't get the data with the provided service and key"));
    }
  }

  @override
  Future<Either<Exception, bool>> writeData({required String service, required String key, required value}) async {
    late Box box;
    if (Hive.isBoxOpen(service)) {
      box = Hive.box(service);
    } else {
      box = await Hive.openBox(service);
    }
    box.put(key, value);

    return const Right(true);
  }

  @override
  Future<Either<Exception, bool>> writeDataSecureData(
      {required String service, required String key, required value}) async {
    const secureStorage = FlutterSecureStorage();
    //final alredyExistKey =
    //  await secureStorage.containsKey(key: StorageKeys.FLUTTER_SECURE_KEY);
    //if (!alredyExistKey) {
    final encryprionKey = await secureStorage.read(key: StorageKeys.flutterSecureKey);
    if (encryprionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: StorageKeys.flutterSecureKey,
        value: base64UrlEncode(key),
      );
    }
    //}
    final keyHash = await secureStorage.read(key: StorageKeys.flutterSecureKey);
    final encryptionKey = base64Url.decode(keyHash!);
    final encryptedBox = await Hive.openBox(service, encryptionCipher: HiveAesCipher(encryptionKey));
    encryptedBox.put(key, value);
    return const Right(true);
  }

  @override
  Future<Either<Exception, dynamic>> getDataSecureData(
      {required String service, required String key, String? secureKey}) async {
    const secureStorage = FlutterSecureStorage();
    final alredyExistKey = await secureStorage.containsKey(key: StorageKeys.flutterSecureKey);
    if (alredyExistKey) {
      try {
        final keyHash = await secureStorage.read(key: StorageKeys.flutterSecureKey);
        final encryptionKey = base64Url.decode(keyHash!);
        final encryptedBox = await Hive.openBox(service, encryptionCipher: HiveAesCipher(encryptionKey));
        return Right(await encryptedBox.get(key));
      } catch (_) {
        return Left(Exception(""));
      }
    } else {
      return Left(Exception(""));
    }
  }
}
