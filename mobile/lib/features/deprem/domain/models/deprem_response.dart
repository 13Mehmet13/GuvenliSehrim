import 'deprem_model.dart';

class DepremResponse {
  final int count;
  final String lastUpdate;
  final List<DepremModel> earthquakes;

  DepremResponse({
    required this.count,
    required this.lastUpdate,
    required this.earthquakes,
  });

  factory DepremResponse.fromJson(Map<String, dynamic> json) {
    return DepremResponse(
      count: json['count'] as int,
      lastUpdate: json['last_update'] as String,
      earthquakes: (json['earthquakes'] as List<dynamic>)
          .map((e) => DepremModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
