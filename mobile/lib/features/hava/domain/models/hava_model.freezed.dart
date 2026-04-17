// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hava_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HavaModel _$HavaModelFromJson(Map<String, dynamic> json) {
  return _HavaModel.fromJson(json);
}

/// @nodoc
mixin _$HavaModel {
  String get city => throw _privateConstructorUsedError;
  HavaCurrent get current => throw _privateConstructorUsedError;
  List<HavaForecast> get forecast => throw _privateConstructorUsedError;

  /// Serializes this HavaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HavaModelCopyWith<HavaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HavaModelCopyWith<$Res> {
  factory $HavaModelCopyWith(HavaModel value, $Res Function(HavaModel) then) =
      _$HavaModelCopyWithImpl<$Res, HavaModel>;
  @useResult
  $Res call({String city, HavaCurrent current, List<HavaForecast> forecast});

  $HavaCurrentCopyWith<$Res> get current;
}

/// @nodoc
class _$HavaModelCopyWithImpl<$Res, $Val extends HavaModel>
    implements $HavaModelCopyWith<$Res> {
  _$HavaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as HavaCurrent,
      forecast: null == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<HavaForecast>,
    ) as $Val);
  }

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HavaCurrentCopyWith<$Res> get current {
    return $HavaCurrentCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HavaModelImplCopyWith<$Res>
    implements $HavaModelCopyWith<$Res> {
  factory _$$HavaModelImplCopyWith(
          _$HavaModelImpl value, $Res Function(_$HavaModelImpl) then) =
      __$$HavaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String city, HavaCurrent current, List<HavaForecast> forecast});

  @override
  $HavaCurrentCopyWith<$Res> get current;
}

/// @nodoc
class __$$HavaModelImplCopyWithImpl<$Res>
    extends _$HavaModelCopyWithImpl<$Res, _$HavaModelImpl>
    implements _$$HavaModelImplCopyWith<$Res> {
  __$$HavaModelImplCopyWithImpl(
      _$HavaModelImpl _value, $Res Function(_$HavaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(_$HavaModelImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as HavaCurrent,
      forecast: null == forecast
          ? _value._forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<HavaForecast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HavaModelImpl implements _HavaModel {
  const _$HavaModelImpl(
      {required this.city,
      required this.current,
      required final List<HavaForecast> forecast})
      : _forecast = forecast;

  factory _$HavaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HavaModelImplFromJson(json);

  @override
  final String city;
  @override
  final HavaCurrent current;
  final List<HavaForecast> _forecast;
  @override
  List<HavaForecast> get forecast {
    if (_forecast is EqualUnmodifiableListView) return _forecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecast);
  }

  @override
  String toString() {
    return 'HavaModel(city: $city, current: $current, forecast: $forecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HavaModelImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other._forecast, _forecast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, current,
      const DeepCollectionEquality().hash(_forecast));

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HavaModelImplCopyWith<_$HavaModelImpl> get copyWith =>
      __$$HavaModelImplCopyWithImpl<_$HavaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HavaModelImplToJson(
      this,
    );
  }
}

abstract class _HavaModel implements HavaModel {
  const factory _HavaModel(
      {required final String city,
      required final HavaCurrent current,
      required final List<HavaForecast> forecast}) = _$HavaModelImpl;

  factory _HavaModel.fromJson(Map<String, dynamic> json) =
      _$HavaModelImpl.fromJson;

  @override
  String get city;
  @override
  HavaCurrent get current;
  @override
  List<HavaForecast> get forecast;

  /// Create a copy of HavaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HavaModelImplCopyWith<_$HavaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HavaCurrent _$HavaCurrentFromJson(Map<String, dynamic> json) {
  return _HavaCurrent.fromJson(json);
}

/// @nodoc
mixin _$HavaCurrent {
  double get temp => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get wind => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'feels_like')
  double get feelsLike => throw _privateConstructorUsedError;

  /// Serializes this HavaCurrent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HavaCurrent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HavaCurrentCopyWith<HavaCurrent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HavaCurrentCopyWith<$Res> {
  factory $HavaCurrentCopyWith(
          HavaCurrent value, $Res Function(HavaCurrent) then) =
      _$HavaCurrentCopyWithImpl<$Res, HavaCurrent>;
  @useResult
  $Res call(
      {double temp,
      int humidity,
      double wind,
      String condition,
      @JsonKey(name: 'feels_like') double feelsLike});
}

/// @nodoc
class _$HavaCurrentCopyWithImpl<$Res, $Val extends HavaCurrent>
    implements $HavaCurrentCopyWith<$Res> {
  _$HavaCurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HavaCurrent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? wind = null,
    Object? condition = null,
    Object? feelsLike = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HavaCurrentImplCopyWith<$Res>
    implements $HavaCurrentCopyWith<$Res> {
  factory _$$HavaCurrentImplCopyWith(
          _$HavaCurrentImpl value, $Res Function(_$HavaCurrentImpl) then) =
      __$$HavaCurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temp,
      int humidity,
      double wind,
      String condition,
      @JsonKey(name: 'feels_like') double feelsLike});
}

/// @nodoc
class __$$HavaCurrentImplCopyWithImpl<$Res>
    extends _$HavaCurrentCopyWithImpl<$Res, _$HavaCurrentImpl>
    implements _$$HavaCurrentImplCopyWith<$Res> {
  __$$HavaCurrentImplCopyWithImpl(
      _$HavaCurrentImpl _value, $Res Function(_$HavaCurrentImpl) _then)
      : super(_value, _then);

  /// Create a copy of HavaCurrent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? wind = null,
    Object? condition = null,
    Object? feelsLike = null,
  }) {
    return _then(_$HavaCurrentImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HavaCurrentImpl implements _HavaCurrent {
  const _$HavaCurrentImpl(
      {required this.temp,
      required this.humidity,
      required this.wind,
      required this.condition,
      @JsonKey(name: 'feels_like') required this.feelsLike});

  factory _$HavaCurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$HavaCurrentImplFromJson(json);

  @override
  final double temp;
  @override
  final int humidity;
  @override
  final double wind;
  @override
  final String condition;
  @override
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @override
  String toString() {
    return 'HavaCurrent(temp: $temp, humidity: $humidity, wind: $wind, condition: $condition, feelsLike: $feelsLike)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HavaCurrentImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temp, humidity, wind, condition, feelsLike);

  /// Create a copy of HavaCurrent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HavaCurrentImplCopyWith<_$HavaCurrentImpl> get copyWith =>
      __$$HavaCurrentImplCopyWithImpl<_$HavaCurrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HavaCurrentImplToJson(
      this,
    );
  }
}

abstract class _HavaCurrent implements HavaCurrent {
  const factory _HavaCurrent(
          {required final double temp,
          required final int humidity,
          required final double wind,
          required final String condition,
          @JsonKey(name: 'feels_like') required final double feelsLike}) =
      _$HavaCurrentImpl;

  factory _HavaCurrent.fromJson(Map<String, dynamic> json) =
      _$HavaCurrentImpl.fromJson;

  @override
  double get temp;
  @override
  int get humidity;
  @override
  double get wind;
  @override
  String get condition;
  @override
  @JsonKey(name: 'feels_like')
  double get feelsLike;

  /// Create a copy of HavaCurrent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HavaCurrentImplCopyWith<_$HavaCurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HavaForecast _$HavaForecastFromJson(Map<String, dynamic> json) {
  return _HavaForecast.fromJson(json);
}

/// @nodoc
mixin _$HavaForecast {
  String get date => throw _privateConstructorUsedError;
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;

  /// Serializes this HavaForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HavaForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HavaForecastCopyWith<HavaForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HavaForecastCopyWith<$Res> {
  factory $HavaForecastCopyWith(
          HavaForecast value, $Res Function(HavaForecast) then) =
      _$HavaForecastCopyWithImpl<$Res, HavaForecast>;
  @useResult
  $Res call({String date, double min, double max, String condition});
}

/// @nodoc
class _$HavaForecastCopyWithImpl<$Res, $Val extends HavaForecast>
    implements $HavaForecastCopyWith<$Res> {
  _$HavaForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HavaForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? min = null,
    Object? max = null,
    Object? condition = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HavaForecastImplCopyWith<$Res>
    implements $HavaForecastCopyWith<$Res> {
  factory _$$HavaForecastImplCopyWith(
          _$HavaForecastImpl value, $Res Function(_$HavaForecastImpl) then) =
      __$$HavaForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, double min, double max, String condition});
}

/// @nodoc
class __$$HavaForecastImplCopyWithImpl<$Res>
    extends _$HavaForecastCopyWithImpl<$Res, _$HavaForecastImpl>
    implements _$$HavaForecastImplCopyWith<$Res> {
  __$$HavaForecastImplCopyWithImpl(
      _$HavaForecastImpl _value, $Res Function(_$HavaForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of HavaForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? min = null,
    Object? max = null,
    Object? condition = null,
  }) {
    return _then(_$HavaForecastImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HavaForecastImpl implements _HavaForecast {
  const _$HavaForecastImpl(
      {required this.date,
      required this.min,
      required this.max,
      required this.condition});

  factory _$HavaForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$HavaForecastImplFromJson(json);

  @override
  final String date;
  @override
  final double min;
  @override
  final double max;
  @override
  final String condition;

  @override
  String toString() {
    return 'HavaForecast(date: $date, min: $min, max: $max, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HavaForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, min, max, condition);

  /// Create a copy of HavaForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HavaForecastImplCopyWith<_$HavaForecastImpl> get copyWith =>
      __$$HavaForecastImplCopyWithImpl<_$HavaForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HavaForecastImplToJson(
      this,
    );
  }
}

abstract class _HavaForecast implements HavaForecast {
  const factory _HavaForecast(
      {required final String date,
      required final double min,
      required final double max,
      required final String condition}) = _$HavaForecastImpl;

  factory _HavaForecast.fromJson(Map<String, dynamic> json) =
      _$HavaForecastImpl.fromJson;

  @override
  String get date;
  @override
  double get min;
  @override
  double get max;
  @override
  String get condition;

  /// Create a copy of HavaForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HavaForecastImplCopyWith<_$HavaForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
