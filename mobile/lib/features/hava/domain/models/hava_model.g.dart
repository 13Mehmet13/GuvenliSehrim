// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hava_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HavaModelImpl _$$HavaModelImplFromJson(Map<String, dynamic> json) =>
    _$HavaModelImpl(
      city: json['city'] as String,
      current: HavaCurrent.fromJson(json['current'] as Map<String, dynamic>),
      forecast: (json['forecast'] as List<dynamic>)
          .map((e) => HavaForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HavaModelImplToJson(_$HavaModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'current': instance.current,
      'forecast': instance.forecast,
    };

_$HavaCurrentImpl _$$HavaCurrentImplFromJson(Map<String, dynamic> json) =>
    _$HavaCurrentImpl(
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      wind: (json['wind'] as num).toDouble(),
      condition: json['condition'] as String,
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$$HavaCurrentImplToJson(_$HavaCurrentImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'wind': instance.wind,
      'condition': instance.condition,
      'feels_like': instance.feelsLike,
    };

_$HavaForecastImpl _$$HavaForecastImplFromJson(Map<String, dynamic> json) =>
    _$HavaForecastImpl(
      date: json['date'] as String,
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$$HavaForecastImplToJson(_$HavaForecastImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'min': instance.min,
      'max': instance.max,
      'condition': instance.condition,
    };
