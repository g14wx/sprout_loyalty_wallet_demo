// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_from_env_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreFromEnvModel {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get nameEnv => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreFromEnvModelCopyWith<StoreFromEnvModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreFromEnvModelCopyWith<$Res> {
  factory $StoreFromEnvModelCopyWith(StoreFromEnvModel value, $Res Function(StoreFromEnvModel) then) =
      _$StoreFromEnvModelCopyWithImpl<$Res, StoreFromEnvModel>;
  @useResult
  $Res call({String name, int id, String nameEnv});
}

/// @nodoc
class _$StoreFromEnvModelCopyWithImpl<$Res, $Val extends StoreFromEnvModel>
    implements $StoreFromEnvModelCopyWith<$Res> {
  _$StoreFromEnvModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? nameEnv = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEnv: null == nameEnv
          ? _value.nameEnv
          : nameEnv // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreFromEnvModelImplCopyWith<$Res> implements $StoreFromEnvModelCopyWith<$Res> {
  factory _$$StoreFromEnvModelImplCopyWith(_$StoreFromEnvModelImpl value, $Res Function(_$StoreFromEnvModelImpl) then) =
      __$$StoreFromEnvModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String nameEnv});
}

/// @nodoc
class __$$StoreFromEnvModelImplCopyWithImpl<$Res> extends _$StoreFromEnvModelCopyWithImpl<$Res, _$StoreFromEnvModelImpl>
    implements _$$StoreFromEnvModelImplCopyWith<$Res> {
  __$$StoreFromEnvModelImplCopyWithImpl(_$StoreFromEnvModelImpl _value, $Res Function(_$StoreFromEnvModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? nameEnv = null,
  }) {
    return _then(_$StoreFromEnvModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEnv: null == nameEnv
          ? _value.nameEnv
          : nameEnv // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoreFromEnvModelImpl implements _StoreFromEnvModel {
  const _$StoreFromEnvModelImpl({required this.name, required this.id, required this.nameEnv});

  @override
  final String name;
  @override
  final int id;
  @override
  final String nameEnv;

  @override
  String toString() {
    return 'StoreFromEnvModel(name: $name, id: $id, nameEnv: $nameEnv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreFromEnvModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEnv, nameEnv) || other.nameEnv == nameEnv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id, nameEnv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreFromEnvModelImplCopyWith<_$StoreFromEnvModelImpl> get copyWith =>
      __$$StoreFromEnvModelImplCopyWithImpl<_$StoreFromEnvModelImpl>(this, _$identity);
}

abstract class _StoreFromEnvModel implements StoreFromEnvModel {
  const factory _StoreFromEnvModel({required final String name, required final int id, required final String nameEnv}) =
      _$StoreFromEnvModelImpl;

  @override
  String get name;
  @override
  int get id;
  @override
  String get nameEnv;
  @override
  @JsonKey(ignore: true)
  _$$StoreFromEnvModelImplCopyWith<_$StoreFromEnvModelImpl> get copyWith => throw _privateConstructorUsedError;
}
