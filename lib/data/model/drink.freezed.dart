// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiDrink _$ApiDrinkFromJson(Map<String, dynamic> json) {
  return _ApiDrink.fromJson(json);
}

/// @nodoc
mixin _$ApiDrink {
  String get name => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiDrinkCopyWith<ApiDrink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiDrinkCopyWith<$Res> {
  factory $ApiDrinkCopyWith(ApiDrink value, $Res Function(ApiDrink) then) =
      _$ApiDrinkCopyWithImpl<$Res, ApiDrink>;
  @useResult
  $Res call({String name, int volume});
}

/// @nodoc
class _$ApiDrinkCopyWithImpl<$Res, $Val extends ApiDrink>
    implements $ApiDrinkCopyWith<$Res> {
  _$ApiDrinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiDrinkImplCopyWith<$Res>
    implements $ApiDrinkCopyWith<$Res> {
  factory _$$ApiDrinkImplCopyWith(
          _$ApiDrinkImpl value, $Res Function(_$ApiDrinkImpl) then) =
      __$$ApiDrinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int volume});
}

/// @nodoc
class __$$ApiDrinkImplCopyWithImpl<$Res>
    extends _$ApiDrinkCopyWithImpl<$Res, _$ApiDrinkImpl>
    implements _$$ApiDrinkImplCopyWith<$Res> {
  __$$ApiDrinkImplCopyWithImpl(
      _$ApiDrinkImpl _value, $Res Function(_$ApiDrinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? volume = null,
  }) {
    return _then(_$ApiDrinkImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiDrinkImpl implements _ApiDrink {
  const _$ApiDrinkImpl({this.name = '', this.volume = 0});

  factory _$ApiDrinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiDrinkImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int volume;

  @override
  String toString() {
    return 'ApiDrink(name: $name, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDrinkImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDrinkImplCopyWith<_$ApiDrinkImpl> get copyWith =>
      __$$ApiDrinkImplCopyWithImpl<_$ApiDrinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiDrinkImplToJson(
      this,
    );
  }
}

abstract class _ApiDrink implements ApiDrink {
  const factory _ApiDrink({final String name, final int volume}) =
      _$ApiDrinkImpl;

  factory _ApiDrink.fromJson(Map<String, dynamic> json) =
      _$ApiDrinkImpl.fromJson;

  @override
  String get name;
  @override
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$ApiDrinkImplCopyWith<_$ApiDrinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
