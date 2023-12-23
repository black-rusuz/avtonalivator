// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) {
  return _ApiConfig.fromJson(json);
}

/// @nodoc
mixin _$ApiConfig {
  String? get accentColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiConfigCopyWith<ApiConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiConfigCopyWith<$Res> {
  factory $ApiConfigCopyWith(ApiConfig value, $Res Function(ApiConfig) then) =
      _$ApiConfigCopyWithImpl<$Res, ApiConfig>;
  @useResult
  $Res call({String? accentColor});
}

/// @nodoc
class _$ApiConfigCopyWithImpl<$Res, $Val extends ApiConfig>
    implements $ApiConfigCopyWith<$Res> {
  _$ApiConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accentColor = freezed,
  }) {
    return _then(_value.copyWith(
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiConfigCopyWith<$Res> implements $ApiConfigCopyWith<$Res> {
  factory _$$_ApiConfigCopyWith(
          _$_ApiConfig value, $Res Function(_$_ApiConfig) then) =
      __$$_ApiConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accentColor});
}

/// @nodoc
class __$$_ApiConfigCopyWithImpl<$Res>
    extends _$ApiConfigCopyWithImpl<$Res, _$_ApiConfig>
    implements _$$_ApiConfigCopyWith<$Res> {
  __$$_ApiConfigCopyWithImpl(
      _$_ApiConfig _value, $Res Function(_$_ApiConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accentColor = freezed,
  }) {
    return _then(_$_ApiConfig(
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiConfig implements _ApiConfig {
  const _$_ApiConfig({this.accentColor});

  factory _$_ApiConfig.fromJson(Map<String, dynamic> json) =>
      _$$_ApiConfigFromJson(json);

  @override
  final String? accentColor;

  @override
  String toString() {
    return 'ApiConfig(accentColor: $accentColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiConfig &&
            (identical(other.accentColor, accentColor) ||
                other.accentColor == accentColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accentColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiConfigCopyWith<_$_ApiConfig> get copyWith =>
      __$$_ApiConfigCopyWithImpl<_$_ApiConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiConfigToJson(
      this,
    );
  }
}

abstract class _ApiConfig implements ApiConfig {
  const factory _ApiConfig({final String? accentColor}) = _$_ApiConfig;

  factory _ApiConfig.fromJson(Map<String, dynamic> json) =
      _$_ApiConfig.fromJson;

  @override
  String? get accentColor;
  @override
  @JsonKey(ignore: true)
  _$$_ApiConfigCopyWith<_$_ApiConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
