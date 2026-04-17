// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'namaz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NamazModel _$NamazModelFromJson(Map<String, dynamic> json) {
  return _NamazModel.fromJson(json);
}

/// @nodoc
mixin _$NamazModel {
  String get city => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  NamazTimes get times => throw _privateConstructorUsedError;
  NamazMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this NamazModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamazModelCopyWith<NamazModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamazModelCopyWith<$Res> {
  factory $NamazModelCopyWith(
          NamazModel value, $Res Function(NamazModel) then) =
      _$NamazModelCopyWithImpl<$Res, NamazModel>;
  @useResult
  $Res call({String city, String date, NamazTimes times, NamazMeta meta});

  $NamazTimesCopyWith<$Res> get times;
  $NamazMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$NamazModelCopyWithImpl<$Res, $Val extends NamazModel>
    implements $NamazModelCopyWith<$Res> {
  _$NamazModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? date = null,
    Object? times = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as NamazTimes,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NamazMeta,
    ) as $Val);
  }

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamazTimesCopyWith<$Res> get times {
    return $NamazTimesCopyWith<$Res>(_value.times, (value) {
      return _then(_value.copyWith(times: value) as $Val);
    });
  }

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamazMetaCopyWith<$Res> get meta {
    return $NamazMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NamazModelImplCopyWith<$Res>
    implements $NamazModelCopyWith<$Res> {
  factory _$$NamazModelImplCopyWith(
          _$NamazModelImpl value, $Res Function(_$NamazModelImpl) then) =
      __$$NamazModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String city, String date, NamazTimes times, NamazMeta meta});

  @override
  $NamazTimesCopyWith<$Res> get times;
  @override
  $NamazMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$NamazModelImplCopyWithImpl<$Res>
    extends _$NamazModelCopyWithImpl<$Res, _$NamazModelImpl>
    implements _$$NamazModelImplCopyWith<$Res> {
  __$$NamazModelImplCopyWithImpl(
      _$NamazModelImpl _value, $Res Function(_$NamazModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? date = null,
    Object? times = null,
    Object? meta = null,
  }) {
    return _then(_$NamazModelImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as NamazTimes,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NamazMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamazModelImpl implements _NamazModel {
  const _$NamazModelImpl(
      {required this.city,
      required this.date,
      required this.times,
      required this.meta});

  factory _$NamazModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamazModelImplFromJson(json);

  @override
  final String city;
  @override
  final String date;
  @override
  final NamazTimes times;
  @override
  final NamazMeta meta;

  @override
  String toString() {
    return 'NamazModel(city: $city, date: $date, times: $times, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamazModelImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.times, times) || other.times == times) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, date, times, meta);

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamazModelImplCopyWith<_$NamazModelImpl> get copyWith =>
      __$$NamazModelImplCopyWithImpl<_$NamazModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamazModelImplToJson(
      this,
    );
  }
}

abstract class _NamazModel implements NamazModel {
  const factory _NamazModel(
      {required final String city,
      required final String date,
      required final NamazTimes times,
      required final NamazMeta meta}) = _$NamazModelImpl;

  factory _NamazModel.fromJson(Map<String, dynamic> json) =
      _$NamazModelImpl.fromJson;

  @override
  String get city;
  @override
  String get date;
  @override
  NamazTimes get times;
  @override
  NamazMeta get meta;

  /// Create a copy of NamazModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamazModelImplCopyWith<_$NamazModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamazTimes _$NamazTimesFromJson(Map<String, dynamic> json) {
  return _NamazTimes.fromJson(json);
}

/// @nodoc
mixin _$NamazTimes {
  String get imsak => throw _privateConstructorUsedError;
  String get gunes => throw _privateConstructorUsedError;
  String get ogle => throw _privateConstructorUsedError;
  String get ikindi => throw _privateConstructorUsedError;
  String get aksam => throw _privateConstructorUsedError;
  String get yatsi => throw _privateConstructorUsedError;

  /// Serializes this NamazTimes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamazTimes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamazTimesCopyWith<NamazTimes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamazTimesCopyWith<$Res> {
  factory $NamazTimesCopyWith(
          NamazTimes value, $Res Function(NamazTimes) then) =
      _$NamazTimesCopyWithImpl<$Res, NamazTimes>;
  @useResult
  $Res call(
      {String imsak,
      String gunes,
      String ogle,
      String ikindi,
      String aksam,
      String yatsi});
}

/// @nodoc
class _$NamazTimesCopyWithImpl<$Res, $Val extends NamazTimes>
    implements $NamazTimesCopyWith<$Res> {
  _$NamazTimesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamazTimes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imsak = null,
    Object? gunes = null,
    Object? ogle = null,
    Object? ikindi = null,
    Object? aksam = null,
    Object? yatsi = null,
  }) {
    return _then(_value.copyWith(
      imsak: null == imsak
          ? _value.imsak
          : imsak // ignore: cast_nullable_to_non_nullable
              as String,
      gunes: null == gunes
          ? _value.gunes
          : gunes // ignore: cast_nullable_to_non_nullable
              as String,
      ogle: null == ogle
          ? _value.ogle
          : ogle // ignore: cast_nullable_to_non_nullable
              as String,
      ikindi: null == ikindi
          ? _value.ikindi
          : ikindi // ignore: cast_nullable_to_non_nullable
              as String,
      aksam: null == aksam
          ? _value.aksam
          : aksam // ignore: cast_nullable_to_non_nullable
              as String,
      yatsi: null == yatsi
          ? _value.yatsi
          : yatsi // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamazTimesImplCopyWith<$Res>
    implements $NamazTimesCopyWith<$Res> {
  factory _$$NamazTimesImplCopyWith(
          _$NamazTimesImpl value, $Res Function(_$NamazTimesImpl) then) =
      __$$NamazTimesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imsak,
      String gunes,
      String ogle,
      String ikindi,
      String aksam,
      String yatsi});
}

/// @nodoc
class __$$NamazTimesImplCopyWithImpl<$Res>
    extends _$NamazTimesCopyWithImpl<$Res, _$NamazTimesImpl>
    implements _$$NamazTimesImplCopyWith<$Res> {
  __$$NamazTimesImplCopyWithImpl(
      _$NamazTimesImpl _value, $Res Function(_$NamazTimesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamazTimes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imsak = null,
    Object? gunes = null,
    Object? ogle = null,
    Object? ikindi = null,
    Object? aksam = null,
    Object? yatsi = null,
  }) {
    return _then(_$NamazTimesImpl(
      imsak: null == imsak
          ? _value.imsak
          : imsak // ignore: cast_nullable_to_non_nullable
              as String,
      gunes: null == gunes
          ? _value.gunes
          : gunes // ignore: cast_nullable_to_non_nullable
              as String,
      ogle: null == ogle
          ? _value.ogle
          : ogle // ignore: cast_nullable_to_non_nullable
              as String,
      ikindi: null == ikindi
          ? _value.ikindi
          : ikindi // ignore: cast_nullable_to_non_nullable
              as String,
      aksam: null == aksam
          ? _value.aksam
          : aksam // ignore: cast_nullable_to_non_nullable
              as String,
      yatsi: null == yatsi
          ? _value.yatsi
          : yatsi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamazTimesImpl implements _NamazTimes {
  const _$NamazTimesImpl(
      {required this.imsak,
      required this.gunes,
      required this.ogle,
      required this.ikindi,
      required this.aksam,
      required this.yatsi});

  factory _$NamazTimesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamazTimesImplFromJson(json);

  @override
  final String imsak;
  @override
  final String gunes;
  @override
  final String ogle;
  @override
  final String ikindi;
  @override
  final String aksam;
  @override
  final String yatsi;

  @override
  String toString() {
    return 'NamazTimes(imsak: $imsak, gunes: $gunes, ogle: $ogle, ikindi: $ikindi, aksam: $aksam, yatsi: $yatsi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamazTimesImpl &&
            (identical(other.imsak, imsak) || other.imsak == imsak) &&
            (identical(other.gunes, gunes) || other.gunes == gunes) &&
            (identical(other.ogle, ogle) || other.ogle == ogle) &&
            (identical(other.ikindi, ikindi) || other.ikindi == ikindi) &&
            (identical(other.aksam, aksam) || other.aksam == aksam) &&
            (identical(other.yatsi, yatsi) || other.yatsi == yatsi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imsak, gunes, ogle, ikindi, aksam, yatsi);

  /// Create a copy of NamazTimes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamazTimesImplCopyWith<_$NamazTimesImpl> get copyWith =>
      __$$NamazTimesImplCopyWithImpl<_$NamazTimesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamazTimesImplToJson(
      this,
    );
  }
}

abstract class _NamazTimes implements NamazTimes {
  const factory _NamazTimes(
      {required final String imsak,
      required final String gunes,
      required final String ogle,
      required final String ikindi,
      required final String aksam,
      required final String yatsi}) = _$NamazTimesImpl;

  factory _NamazTimes.fromJson(Map<String, dynamic> json) =
      _$NamazTimesImpl.fromJson;

  @override
  String get imsak;
  @override
  String get gunes;
  @override
  String get ogle;
  @override
  String get ikindi;
  @override
  String get aksam;
  @override
  String get yatsi;

  /// Create a copy of NamazTimes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamazTimesImplCopyWith<_$NamazTimesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamazMeta _$NamazMetaFromJson(Map<String, dynamic> json) {
  return _NamazMeta.fromJson(json);
}

/// @nodoc
mixin _$NamazMeta {
  String get method => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  /// Serializes this NamazMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamazMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamazMetaCopyWith<NamazMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamazMetaCopyWith<$Res> {
  factory $NamazMetaCopyWith(NamazMeta value, $Res Function(NamazMeta) then) =
      _$NamazMetaCopyWithImpl<$Res, NamazMeta>;
  @useResult
  $Res call({String method, String timezone});
}

/// @nodoc
class _$NamazMetaCopyWithImpl<$Res, $Val extends NamazMeta>
    implements $NamazMetaCopyWith<$Res> {
  _$NamazMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamazMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamazMetaImplCopyWith<$Res>
    implements $NamazMetaCopyWith<$Res> {
  factory _$$NamazMetaImplCopyWith(
          _$NamazMetaImpl value, $Res Function(_$NamazMetaImpl) then) =
      __$$NamazMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String method, String timezone});
}

/// @nodoc
class __$$NamazMetaImplCopyWithImpl<$Res>
    extends _$NamazMetaCopyWithImpl<$Res, _$NamazMetaImpl>
    implements _$$NamazMetaImplCopyWith<$Res> {
  __$$NamazMetaImplCopyWithImpl(
      _$NamazMetaImpl _value, $Res Function(_$NamazMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamazMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? timezone = null,
  }) {
    return _then(_$NamazMetaImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamazMetaImpl implements _NamazMeta {
  const _$NamazMetaImpl({required this.method, required this.timezone});

  factory _$NamazMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamazMetaImplFromJson(json);

  @override
  final String method;
  @override
  final String timezone;

  @override
  String toString() {
    return 'NamazMeta(method: $method, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamazMetaImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, timezone);

  /// Create a copy of NamazMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamazMetaImplCopyWith<_$NamazMetaImpl> get copyWith =>
      __$$NamazMetaImplCopyWithImpl<_$NamazMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamazMetaImplToJson(
      this,
    );
  }
}

abstract class _NamazMeta implements NamazMeta {
  const factory _NamazMeta(
      {required final String method,
      required final String timezone}) = _$NamazMetaImpl;

  factory _NamazMeta.fromJson(Map<String, dynamic> json) =
      _$NamazMetaImpl.fromJson;

  @override
  String get method;
  @override
  String get timezone;

  /// Create a copy of NamazMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamazMetaImplCopyWith<_$NamazMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
