// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCocktail _$ApiCocktailFromJson(Map<String, dynamic> json) {
  return _ApiCocktail.fromJson(json);
}

/// @nodoc
mixin _$ApiCocktail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<ApiDrink> get drinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCocktailCopyWith<ApiCocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCocktailCopyWith<$Res> {
  factory $ApiCocktailCopyWith(
          ApiCocktail value, $Res Function(ApiCocktail) then) =
      _$ApiCocktailCopyWithImpl<$Res, ApiCocktail>;
  @useResult
  $Res call({int id, String name, String imageUrl, List<ApiDrink> drinks});
}

/// @nodoc
class _$ApiCocktailCopyWithImpl<$Res, $Val extends ApiCocktail>
    implements $ApiCocktailCopyWith<$Res> {
  _$ApiCocktailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? drinks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<ApiDrink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiCocktailCopyWith<$Res>
    implements $ApiCocktailCopyWith<$Res> {
  factory _$$_ApiCocktailCopyWith(
          _$_ApiCocktail value, $Res Function(_$_ApiCocktail) then) =
      __$$_ApiCocktailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl, List<ApiDrink> drinks});
}

/// @nodoc
class __$$_ApiCocktailCopyWithImpl<$Res>
    extends _$ApiCocktailCopyWithImpl<$Res, _$_ApiCocktail>
    implements _$$_ApiCocktailCopyWith<$Res> {
  __$$_ApiCocktailCopyWithImpl(
      _$_ApiCocktail _value, $Res Function(_$_ApiCocktail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? drinks = null,
  }) {
    return _then(_$_ApiCocktail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<ApiDrink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiCocktail implements _ApiCocktail {
  const _$_ApiCocktail(
      {required this.id,
      this.name = '',
      this.imageUrl = '',
      final List<ApiDrink> drinks = const []})
      : _drinks = drinks;

  factory _$_ApiCocktail.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCocktailFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;
  final List<ApiDrink> _drinks;
  @override
  @JsonKey()
  List<ApiDrink> get drinks {
    if (_drinks is EqualUnmodifiableListView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinks);
  }

  @override
  String toString() {
    return 'ApiCocktail(id: $id, name: $name, imageUrl: $imageUrl, drinks: $drinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiCocktail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl,
      const DeepCollectionEquality().hash(_drinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiCocktailCopyWith<_$_ApiCocktail> get copyWith =>
      __$$_ApiCocktailCopyWithImpl<_$_ApiCocktail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCocktailToJson(
      this,
    );
  }
}

abstract class _ApiCocktail implements ApiCocktail {
  const factory _ApiCocktail(
      {required final int id,
      final String name,
      final String imageUrl,
      final List<ApiDrink> drinks}) = _$_ApiCocktail;

  factory _ApiCocktail.fromJson(Map<String, dynamic> json) =
      _$_ApiCocktail.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  List<ApiDrink> get drinks;
  @override
  @JsonKey(ignore: true)
  _$$_ApiCocktailCopyWith<_$_ApiCocktail> get copyWith =>
      throw _privateConstructorUsedError;
}
