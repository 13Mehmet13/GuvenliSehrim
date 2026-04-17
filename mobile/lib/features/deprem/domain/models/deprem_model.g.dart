// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deprem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepremModelImpl _$$DepremModelImplFromJson(Map<String, dynamic> json) =>
    _$DepremModelImpl(
      id: json['id'] as String,
      date: json['date'] as String,
      title: json['title'] as String,
      mag: (json['mag'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      location: json['location'] as String,
    );

Map<String, dynamic> _$$DepremModelImplToJson(_$DepremModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'title': instance.title,
      'mag': instance.mag,
      'depth': instance.depth,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
    };
