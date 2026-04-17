import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import '../../domain/models/deprem_response.dart';
import '../../domain/repositories/deprem_repository.dart';

class DepremRepositoryImpl implements IDepremRepository {
  final Dio _dio;
  final Box _cacheBox;

  DepremRepositoryImpl(this._dio) : _cacheBox = HiveService.box(HiveService.depremCache);

  @override
  Future<DepremResponse> getDeprem() async {
    try {
      final response = await _dio.get('/deprem');
      final rawData = response.data['data'];
      final data = DepremResponse.fromJson(rawData);
      
      // Cache the successful response
      await _cacheBox.put('last_depremler', rawData);
      return data;
    } catch (e) {
      // Offline fallback
      final cachedData = _cacheBox.get('last_depremler');
      if (cachedData != null) {
        return DepremResponse.fromJson(Map<String, dynamic>.from(cachedData));
      }
      rethrow;
    }
  }
}
