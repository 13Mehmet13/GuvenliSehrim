import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/network/dio_client.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/providers/refresh_provider.dart';
import '../../domain/models/namaz_model.dart';
import '../../domain/repositories/namaz_repository.dart';
import '../../data/repositories/namaz_repository_impl.dart';

// Dependency Inversion for Namaz Repository
final namazRepositoryProvider = Provider<INamazRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return NamazRepositoryImpl(dio);
});

final namazProvider = FutureProvider<NamazModel>((ref) async {
  final cityState = ref.watch(cityProvider);
  ref.watch(refreshTimerProvider);
  
  final repository = ref.watch(namazRepositoryProvider);
  
  return repository.getNamaz(cityState.activeCity);
});
