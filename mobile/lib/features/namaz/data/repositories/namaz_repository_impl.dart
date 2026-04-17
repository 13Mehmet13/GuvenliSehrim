import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import '../../domain/models/namaz_model.dart';
import '../../domain/repositories/namaz_repository.dart';

class NamazRepositoryImpl implements INamazRepository {
  final Dio _dio;
  final Box _cacheBox;

  NamazRepositoryImpl(this._dio) : _cacheBox = Hive.box(HiveService.namazCache);

  @override
  Future<NamazModel> getNamaz(String city) async {
    try {
      final response = await _dio.get('/namaz', queryParameters: {'sehir': city});
      final data = NamazModel.fromJson(response.data['data']);
      
      // Cache the successful response
      await _cacheBox.put(city, response.data['data']);
      return data;
    } catch (e) {
      // Offline fallback
      final cachedData = _cacheBox.get(city);
      if (cachedData != null) {
        return NamazModel.fromJson(Map<String, dynamic>.from(cachedData));
      }
      rethrow;
    }
  }
}
