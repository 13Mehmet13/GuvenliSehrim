// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aqi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AqiModel _$AqiModelFromJson(Map<String, dynamic> json) {
  return _AqiModel.fromJson(json);
}

/// @nodoc
mixin _$AqiModel {
  String get city => throw _privateConstructorUsedError;
  int get aqi => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  Pollutants get pollutants => throw _privateConstructorUsedError;

  /// Serializes this AqiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AqiModelCopyWith<AqiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AqiModelCopyWith<$Res> {
  factory $AqiModelCopyWith(AqiModel value, $Res Function(AqiModel) then) =
      _$AqiModelCopyWithImpl<$Res, AqiModel>;
  @useResult
  $Res call(
      {String city,
      int aqi,
      String status,
      String description,
      String color,
      Pollutants pollutants});

  $PollutantsCopyWith<$Res> get pollutants;
}

/// @nodoc
class _$AqiModelCopyWithImpl<$Res, $Val extends AqiModel>
    implements $AqiModelCopyWith<$Res> {
  _$AqiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? aqi = null,
    Object? status = null,
    Object? description = null,
    Object? color = null,
    Object? pollutants = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      aqi: null == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      pollutants: null == pollutants
          ? _value.pollutants
          : pollutants // ignore: cast_nullable_to_non_nullable
              as Pollutants,
    ) as $Val);
  }

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollutantsCopyWith<$Res> get pollutants {
    return $PollutantsCopyWith<$Res>(_value.pollutants, (value) {
      return _then(_value.copyWith(pollutants: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AqiModelImplCopyWith<$Res>
    implements $AqiModelCopyWith<$Res> {
  factory _$$AqiModelImplCopyWith(
          _$AqiModelImpl value, $Res Function(_$AqiModelImpl) then) =
      __$$AqiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String city,
      int aqi,
      String status,
      String description,
      String color,
      Pollutants pollutants});

  @override
  $PollutantsCopyWith<$Res> get pollutants;
}

/// @nodoc
class __$$AqiModelImplCopyWithImpl<$Res>
    extends _$AqiModelCopyWithImpl<$Res, _$AqiModelImpl>
    implements _$$AqiModelImplCopyWith<$Res> {
  __$$AqiModelImplCopyWithImpl(
      _$AqiModelImpl _value, $Res Function(_$AqiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? aqi = null,
    Object? status = null,
    Object? description = null,
    Object? color = null,
    Object? pollutants = null,
  }) {
    return _then(_$AqiModelImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      aqi: null == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      pollutants: null == pollutants
          ? _value.pollutants
          : pollutants // ignore: cast_nullable_to_non_nullable
              as Pollutants,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AqiModelImpl implements _AqiModel {
  const _$AqiModelImpl(
      {required this.city,
      required this.aqi,
      required this.status,
      required this.description,
      required this.color,
      required this.pollutants});

  factory _$AqiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AqiModelImplFromJson(json);

  @override
  final String city;
  @override
  final int aqi;
  @override
  final String status;
  @override
  final String description;
  @override
  final String color;
  @override
  final Pollutants pollutants;

  @override
  String toString() {
    return 'AqiModel(city: $city, aqi: $aqi, status: $status, description: $description, color: $color, pollutants: $pollutants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AqiModelImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.pollutants, pollutants) ||
                other.pollutants == pollutants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, city, aqi, status, description, color, pollutants);

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AqiModelImplCopyWith<_$AqiModelImpl> get copyWith =>
      __$$AqiModelImplCopyWithImpl<_$AqiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AqiModelImplToJson(
      this,
    );
  }
}

abstract class _AqiModel implements AqiModel {
  const factory _AqiModel(
      {required final String city,
      required final int aqi,
      required final String status,
      required final String description,
      required final String color,
      required final Pollutants pollutants}) = _$AqiModelImpl;

  factory _AqiModel.fromJson(Map<String, dynamic> json) =
      _$AqiModelImpl.fromJson;

  @override
  String get city;
  @override
  int get aqi;
  @override
  String get status;
  @override
  String get description;
  @override
  String get color;
  @override
  Pollutants get pollutants;

  /// Create a copy of AqiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AqiModelImplCopyWith<_$AqiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pollutants _$PollutantsFromJson(Map<String, dynamic> json) {
  return _Pollutants.fromJson(json);
}

/// @nodoc
mixin _$Pollutants {
  @JsonKey(name: 'pm10')
  double get pm10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pm25')
  double get pm25 => throw _privateConstructorUsedError;
  @JsonKey(name: 'no2')
  double get no2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'so2')
  double get so2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'o3')
  double get o3 => throw _privateConstructorUsedError;

  /// Serializes this Pollutants to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pollutants
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollutantsCopyWith<Pollutants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollutantsCopyWith<$Res> {
  factory $PollutantsCopyWith(
          Pollutants value, $Res Function(Pollutants) then) =
      _$PollutantsCopyWithImpl<$Res, Pollutants>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pm10') double pm10,
      @JsonKey(name: 'pm25') double pm25,
      @JsonKey(name: 'no2') double no2,
      @JsonKey(name: 'so2') double so2,
      @JsonKey(name: 'o3') double o3});
}

/// @nodoc
class _$PollutantsCopyWithImpl<$Res, $Val extends Pollutants>
    implements $PollutantsCopyWith<$Res> {
  _$PollutantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pollutants
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pm10 = null,
    Object? pm25 = null,
    Object? no2 = null,
    Object? so2 = null,
    Object? o3 = null,
  }) {
    return _then(_value.copyWith(
      pm10: null == pm10
          ? _value.pm10
          : pm10 // ignore: cast_nullable_to_non_nullable
              as double,
      pm25: null == pm25
          ? _value.pm25
          : pm25 // ignore: cast_nullable_to_non_nullable
              as double,
      no2: null == no2
          ? _value.no2
          : no2 // ignore: cast_nullable_to_non_nullable
              as double,
      so2: null == so2
          ? _value.so2
          : so2 // ignore: cast_nullable_to_non_nullable
              as double,
      o3: null == o3
          ? _value.o3
          : o3 // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollutantsImplCopyWith<$Res>
    implements $PollutantsCopyWith<$Res> {
  factory _$$PollutantsImplCopyWith(
          _$PollutantsImpl value, $Res Function(_$PollutantsImpl) then) =
      __$$PollutantsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pm10') double pm10,
      @JsonKey(name: 'pm25') double pm25,
      @JsonKey(name: 'no2') double no2,
      @JsonKey(name: 'so2') double so2,
      @JsonKey(name: 'o3') double o3});
}

/// @nodoc
class __$$PollutantsImplCopyWithImpl<$Res>
    extends _$PollutantsCopyWithImpl<$Res, _$PollutantsImpl>
    implements _$$PollutantsImplCopyWith<$Res> {
  __$$PollutantsImplCopyWithImpl(
      _$PollutantsImpl _value, $Res Function(_$PollutantsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pollutants
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pm10 = null,
    Object? pm25 = null,
    Object? no2 = null,
    Object? so2 = null,
    Object? o3 = null,
  }) {
    return _then(_$PollutantsImpl(
      pm10: null == pm10
          ? _value.pm10
          : pm10 // ignore: cast_nullable_to_non_nullable
              as double,
      pm25: null == pm25
          ? _value.pm25
          : pm25 // ignore: cast_nullable_to_non_nullable
              as double,
      no2: null == no2
          ? _value.no2
          : no2 // ignore: cast_nullable_to_non_nullable
              as double,
      so2: null == so2
          ? _value.so2
          : so2 // ignore: cast_nullable_to_non_nullable
              as double,
      o3: null == o3
          ? _value.o3
          : o3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollutantsImpl implements _Pollutants {
  const _$PollutantsImpl(
      {@JsonKey(name: 'pm10') required this.pm10,
      @JsonKey(name: 'pm25') required this.pm25,
      @JsonKey(name: 'no2') required this.no2,
      @JsonKey(name: 'so2') required this.so2,
      @JsonKey(name: 'o3') required this.o3});

  factory _$PollutantsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollutantsImplFromJson(json);

  @override
  @JsonKey(name: 'pm10')
  final double pm10;
  @override
  @JsonKey(name: 'pm25')
  final double pm25;
  @override
  @JsonKey(name: 'no2')
  final double no2;
  @override
  @JsonKey(name: 'so2')
  final double so2;
  @override
  @JsonKey(name: 'o3')
  final double o3;

  @override
  String toString() {
    return 'Pollutants(pm10: $pm10, pm25: $pm25, no2: $no2, so2: $so2, o3: $o3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollutantsImpl &&
            (identical(other.pm10, pm10) || other.pm10 == pm10) &&
            (identical(other.pm25, pm25) || other.pm25 == pm25) &&
            (identical(other.no2, no2) || other.no2 == no2) &&
            (identical(other.so2, so2) || other.so2 == so2) &&
            (identical(other.o3, o3) || other.o3 == o3));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pm10, pm25, no2, so2, o3);

  /// Create a copy of Pollutants
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollutantsImplCopyWith<_$PollutantsImpl> get copyWith =>
      __$$PollutantsImplCopyWithImpl<_$PollutantsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollutantsImplToJson(
      this,
    );
  }
}

abstract class _Pollutants implements Pollutants {
  const factory _Pollutants(
      {@JsonKey(name: 'pm10') required final double pm10,
      @JsonKey(name: 'pm25') required final double pm25,
      @JsonKey(name: 'no2') required final double no2,
      @JsonKey(name: 'so2') required final double so2,
      @JsonKey(name: 'o3') required final double o3}) = _$PollutantsImpl;

  factory _Pollutants.fromJson(Map<String, dynamic> json) =
      _$PollutantsImpl.fromJson;

  @override
  @JsonKey(name: 'pm10')
  double get pm10;
  @override
  @JsonKey(name: 'pm25')
  double get pm25;
  @override
  @JsonKey(name: 'no2')
  double get no2;
  @override
  @JsonKey(name: 'so2')
  double get so2;
  @override
  @JsonKey(name: 'o3')
  double get o3;

  /// Create a copy of Pollutants
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollutantsImplCopyWith<_$PollutantsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
