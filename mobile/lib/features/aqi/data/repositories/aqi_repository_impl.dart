import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import '../../domain/models/aqi_model.dart';
import '../../domain/repositories/aqi_repository.dart';

class AqiRepositoryImpl implements IAqiRepository {
  final Dio _dio;
  final Box _cacheBox;

  AqiRepositoryImpl(this._dio) : _cacheBox = HiveService.box(HiveService.aqiCache);

  @override
  Future<AqiModel> getAqi(String city) async {
    try {
      final response = await _dio.get('/kalite', queryParameters: {'sehir': city});
      final rawData = response.data['data'];
      final data = AqiModel.fromJson(rawData);
      
      // Cache the successful response
      await _cacheBox.put(city, rawData);
      return data;
    } catch (e) {
      // Offline fallback
      final cachedData = _cacheBox.get(city);
      if (cachedData != null) {
        return AqiModel.fromJson(Map<String, dynamic>.from(cachedData));
      }
      rethrow;
    }
  }
}
