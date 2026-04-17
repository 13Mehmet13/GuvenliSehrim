import 'package:freezed_annotation/freezed_annotation.dart';

part 'namaz_model.freezed.dart';
part 'namaz_model.g.dart';

@freezed
class NamazModel with _$NamazModel {
  const factory NamazModel({
    required String city,
    required String date,
    required NamazTimes times,
    required NamazMeta meta,
  }) = _NamazModel;

  factory NamazModel.fromJson(Map<String, dynamic> json) => _$NamazModelFromJson(json);
}

@freezed
class NamazTimes with _$NamazTimes {
  const factory NamazTimes({
    required String imsak,
    required String gunes,
    required String ogle,
    required String ikindi,
    required String aksam,
    required String yatsi,
  }) = _NamazTimes;

  factory NamazTimes.fromJson(Map<String, dynamic> json) => _$NamazTimesFromJson(json);
}

@freezed
class NamazMeta with _$NamazMeta {
  const factory NamazMeta({
    required String method,
    required String timezone,
  }) = _NamazMeta;

  factory NamazMeta.fromJson(Map<String, dynamic> json) => _$NamazMetaFromJson(json);
}
