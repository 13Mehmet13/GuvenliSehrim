import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/network/dio_client.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/providers/refresh_provider.dart';
import '../../domain/models/hava_model.dart';
import '../../domain/repositories/hava_repository.dart';
import '../../data/repositories/hava_repository_impl.dart';

// Dependency Inversion for Hava Repository
final havaRepositoryProvider = Provider<IHavaRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HavaRepositoryImpl(dio);
});

final havaProvider = FutureProvider<HavaModel>((ref) async {
  final cityState = ref.watch(cityProvider);
  ref.watch(refreshTimerProvider);
  
  final repository = ref.watch(havaRepositoryProvider);
  
  // We use the activeCity from CityState
  return repository.getHava(cityState.activeCity);
});
