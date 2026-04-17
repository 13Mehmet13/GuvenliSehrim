// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'namaz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NamazModelImpl _$$NamazModelImplFromJson(Map<String, dynamic> json) =>
    _$NamazModelImpl(
      city: json['city'] as String,
      date: json['date'] as String,
      times: NamazTimes.fromJson(json['times'] as Map<String, dynamic>),
      meta: NamazMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NamazModelImplToJson(_$NamazModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'date': instance.date,
      'times': instance.times,
      'meta': instance.meta,
    };

_$NamazTimesImpl _$$NamazTimesImplFromJson(Map<String, dynamic> json) =>
    _$NamazTimesImpl(
      imsak: json['imsak'] as String,
      gunes: json['gunes'] as String,
      ogle: json['ogle'] as String,
      ikindi: json['ikindi'] as String,
      aksam: json['aksam'] as String,
      yatsi: json['yatsi'] as String,
    );

Map<String, dynamic> _$$NamazTimesImplToJson(_$NamazTimesImpl instance) =>
    <String, dynamic>{
      'imsak': instance.imsak,
      'gunes': instance.gunes,
      'ogle': instance.ogle,
      'ikindi': instance.ikindi,
      'aksam': instance.aksam,
      'yatsi': instance.yatsi,
    };

_$NamazMetaImpl _$$NamazMetaImplFromJson(Map<String, dynamic> json) =>
    _$NamazMetaImpl(
      method: json['method'] as String,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$$NamazMetaImplToJson(_$NamazMetaImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'timezone': instance.timezone,
    };
