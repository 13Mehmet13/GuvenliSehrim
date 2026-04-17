import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/network/dio_client.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/providers/refresh_provider.dart';
import '../../domain/models/aqi_model.dart';
import '../../domain/repositories/aqi_repository.dart';
import '../../data/repositories/aqi_repository_impl.dart';

// Dependency Inversion for AQI Repository
final aqiRepositoryProvider = Provider<IAqiRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AqiRepositoryImpl(dio);
});

final aqiProvider = FutureProvider<AqiModel>((ref) async {
  final cityState = ref.watch(cityProvider);
  ref.watch(refreshTimerProvider);
  
  final repository = ref.watch(aqiRepositoryProvider);
  
  return repository.getAqi(cityState.activeCity);
});
