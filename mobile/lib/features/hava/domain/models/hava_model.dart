import 'package:freezed_annotation/freezed_annotation.dart';

part 'hava_model.freezed.dart';
part 'hava_model.g.dart';

@freezed
class HavaModel with _$HavaModel {
  const factory HavaModel({
    required String city,
    required HavaCurrent current,
    required List<HavaForecast> forecast,
  }) = _HavaModel;

  factory HavaModel.fromJson(Map<String, dynamic> json) => _$HavaModelFromJson(json);
}

@freezed
class HavaCurrent with _$HavaCurrent {
  const factory HavaCurrent({
    required double temp,
    required int humidity,
    required double wind,
    required String condition,
    @JsonKey(name: 'feels_like') required double feelsLike,
  }) = _HavaCurrent;

  factory HavaCurrent.fromJson(Map<String, dynamic> json) => _$HavaCurrentFromJson(json);
}

@freezed
class HavaForecast with _$HavaForecast {
  const factory HavaForecast({
    required String date,
    required double min,
    required double max,
    required String condition,
  }) = _HavaForecast;

  factory HavaForecast.fromJson(Map<String, dynamic> json) => _$HavaForecastFromJson(json);
}
