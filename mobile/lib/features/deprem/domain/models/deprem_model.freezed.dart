// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deprem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepremModel _$DepremModelFromJson(Map<String, dynamic> json) {
  return _DepremModel.fromJson(json);
}

/// @nodoc
mixin _$DepremModel {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get mag => throw _privateConstructorUsedError;
  double get depth => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Serializes this DepremModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepremModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepremModelCopyWith<DepremModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepremModelCopyWith<$Res> {
  factory $DepremModelCopyWith(
          DepremModel value, $Res Function(DepremModel) then) =
      _$DepremModelCopyWithImpl<$Res, DepremModel>;
  @useResult
  $Res call(
      {String id,
      String date,
      String title,
      double mag,
      double depth,
      double lat,
      double lng,
      String location});
}

/// @nodoc
class _$DepremModelCopyWithImpl<$Res, $Val extends DepremModel>
    implements $DepremModelCopyWith<$Res> {
  _$DepremModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepremModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? title = null,
    Object? mag = null,
    Object? depth = null,
    Object? lat = null,
    Object? lng = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mag: null == mag
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepremModelImplCopyWith<$Res>
    implements $DepremModelCopyWith<$Res> {
  factory _$$DepremModelImplCopyWith(
          _$DepremModelImpl value, $Res Function(_$DepremModelImpl) then) =
      __$$DepremModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String date,
      String title,
      double mag,
      double depth,
      double lat,
      double lng,
      String location});
}

/// @nodoc
class __$$DepremModelImplCopyWithImpl<$Res>
    extends _$DepremModelCopyWithImpl<$Res, _$DepremModelImpl>
    implements _$$DepremModelImplCopyWith<$Res> {
  __$$DepremModelImplCopyWithImpl(
      _$DepremModelImpl _value, $Res Function(_$DepremModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepremModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? title = null,
    Object? mag = null,
    Object? depth = null,
    Object? lat = null,
    Object? lng = null,
    Object? location = null,
  }) {
    return _then(_$DepremModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mag: null == mag
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepremModelImpl extends _DepremModel {
  const _$DepremModelImpl(
      {required this.id,
      required this.date,
      required this.title,
      required this.mag,
      required this.depth,
      required this.lat,
      required this.lng,
      required this.location})
      : super._();

  factory _$DepremModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepremModelImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final String title;
  @override
  final double mag;
  @override
  final double depth;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String location;

  @override
  String toString() {
    return 'DepremModel(id: $id, date: $date, title: $title, mag: $mag, depth: $depth, lat: $lat, lng: $lng, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepremModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mag, mag) || other.mag == mag) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, title, mag, depth, lat, lng, location);

  /// Create a copy of DepremModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepremModelImplCopyWith<_$DepremModelImpl> get copyWith =>
      __$$DepremModelImplCopyWithImpl<_$DepremModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepremModelImplToJson(
      this,
    );
  }
}

abstract class _DepremModel extends DepremModel {
  const factory _DepremModel(
      {required final String id,
      required final String date,
      required final String title,
      required final double mag,
      required final double depth,
      required final double lat,
      required final double lng,
      required final String location}) = _$DepremModelImpl;
  const _DepremModel._() : super._();

  factory _DepremModel.fromJson(Map<String, dynamic> json) =
      _$DepremModelImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  String get title;
  @override
  double get mag;
  @override
  double get depth;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get location;

  /// Create a copy of DepremModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepremModelImplCopyWith<_$DepremModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
