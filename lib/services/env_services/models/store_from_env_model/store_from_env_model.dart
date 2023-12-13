import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_from_env_model.freezed.dart';

@freezed
class StoreFromEnvModel with _$StoreFromEnvModel {
  const factory StoreFromEnvModel({
    required String name,
    required int id,
    required String nameEnv
}) = _StoreFromEnvModel;
}
