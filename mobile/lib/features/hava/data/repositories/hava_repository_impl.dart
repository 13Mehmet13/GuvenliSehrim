import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import '../../domain/models/hava_model.dart';
import '../../domain/repositories/hava_repository.dart';

class HavaRepositoryImpl implements IHavaRepository {
  final Dio _dio;
  final Box _cacheBox;

  HavaRepositoryImpl(this._dio) : _cacheBox = Hive.box(HiveService.havaCache);

  @override
  Future<HavaModel> getHava(String city) async {
    try {
      final response = await _dio.get('/hava', queryParameters: {'sehir': city});
      final data = HavaModel.fromJson(response.data['data']);
      
      // Cache the successful response
      await _cacheBox.put(city, response.data['data']);
      return data;
    } catch (e) {
      // Offline fallback: Attempt to load from cache
      final cachedData = _cacheBox.get(city);
      if (cachedData != null) {
        return HavaModel.fromJson(Map<String, dynamic>.from(cachedData));
      }
      rethrow;
    }
  }
}
