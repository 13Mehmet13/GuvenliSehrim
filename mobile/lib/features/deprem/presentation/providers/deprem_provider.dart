import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/network/dio_client.dart';
import 'package:guvenli_sehrim/core/providers/refresh_provider.dart';
import '../../domain/models/deprem_response.dart';
import '../../domain/repositories/deprem_repository.dart';
import '../../data/repositories/deprem_repository_impl.dart';

// Dependency Inversion for Deprem Repository
final depremRepositoryProvider = Provider<IDepremRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DepremRepositoryImpl(dio);
});

final depremProvider = FutureProvider<DepremResponse>((ref) async {
  ref.watch(refreshTimerProvider);
  final repository = ref.watch(depremRepositoryProvider);
  return repository.getDeprem();
});
