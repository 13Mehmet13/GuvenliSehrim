import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_model.freezed.dart';
part 'aqi_model.g.dart';

@freezed
class AqiModel with _$AqiModel {
  const factory AqiModel({
    required String city,
    required int aqi,
    required String status,
    required String description,
    required String color,
    required Pollutants pollutants,
  }) = _AqiModel;

  factory AqiModel.fromJson(Map<String, dynamic> json) => _$AqiModelFromJson(json);
}

@freezed
class Pollutants with _$Pollutants {
  const factory Pollutants({
    required double pm10,
    required double pm25,
    required double no2,
    required double so2,
    required double o3,
  }) = _Pollutants;

  factory Pollutants.fromJson(Map<String, dynamic> json) => _$PollutantsFromJson(json);
}
