import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import '../../domain/models/doviz_model.dart';
import '../../domain/repositories/doviz_repository.dart';

class DovizRepositoryImpl implements IDovizRepository {
  final Dio _dio;
  final Box _cacheBox;

  DovizRepositoryImpl(this._dio) : _cacheBox = HiveService.box(HiveService.dovizCache);

  @override
  Future<DovizModel> getDoviz() async {
    try {
      final response = await _dio.get('/doviz');
      final rawData = response.data['data'];
      final data = DovizModel.fromJson(rawData);
      
      // Cache the successful response
      await _cacheBox.put('last_rates', rawData);
      return data;
    } catch (e) {
      // Offline fallback
      final cachedData = _cacheBox.get('last_rates');
      if (cachedData != null) {
        return DovizModel.fromJson(Map<String, dynamic>.from(cachedData));
      }
      rethrow;
    }
  }
}
