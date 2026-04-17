import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/network/dio_client.dart';
import 'package:guvenli_sehrim/core/providers/refresh_provider.dart';
import '../../domain/models/doviz_model.dart';
import '../../domain/repositories/doviz_repository.dart';
import '../../data/repositories/doviz_repository_impl.dart';

final dovizRepositoryProvider = Provider<IDovizRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DovizRepositoryImpl(dio);
});

final dovizProvider = FutureProvider<DovizModel>((ref) async {
  ref.watch(refreshTimerProvider);
  final repo = ref.watch(dovizRepositoryProvider);
  return repo.getDoviz();
});
