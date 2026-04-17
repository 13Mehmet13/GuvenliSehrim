import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/deprem.dart';

part 'deprem_model.freezed.dart';
part 'deprem_model.g.dart';

@freezed
class DepremModel with _$DepremModel {
  const factory DepremModel({
    required String id,
    required String date,
    required String title,
    required double mag,
    required double depth,
    required double lat,
    required double lng,
    required String location,
  }) = _DepremModel;

  factory DepremModel.fromJson(Map<String, dynamic> json) => _$DepremModelFromJson(json);

  factory DepremModel.fromDomain(Deprem entity) => DepremModel(
        id: entity.id,
        date: entity.date,
        title: entity.title,
        mag: entity.mag,
        depth: entity.depth,
        lat: entity.lat,
        lng: entity.lng,
        location: entity.location,
      );

  const DepremModel._();

  Deprem toDomain() => Deprem(
        id: id,
        date: date,
        title: title,
        mag: mag,
        depth: depth,
        lat: lat,
        lng: lng,
        location: location,
      );
}
