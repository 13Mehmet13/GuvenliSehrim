// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AqiModelImpl _$$AqiModelImplFromJson(Map<String, dynamic> json) =>
    _$AqiModelImpl(
      city: json['city'] as String,
      aqi: (json['aqi'] as num).toInt(),
      status: json['status'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      pollutants:
          Pollutants.fromJson(json['pollutants'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AqiModelImplToJson(_$AqiModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'aqi': instance.aqi,
      'status': instance.status,
      'description': instance.description,
      'color': instance.color,
      'pollutants': instance.pollutants,
    };

_$PollutantsImpl _$$PollutantsImplFromJson(Map<String, dynamic> json) =>
    _$PollutantsImpl(
      pm10: (json['pm10'] as num).toDouble(),
      pm25: (json['pm25'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
    );

Map<String, dynamic> _$$PollutantsImplToJson(_$PollutantsImpl instance) =>
    <String, dynamic>{
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'no2': instance.no2,
      'so2': instance.so2,
      'o3': instance.o3,
    };
