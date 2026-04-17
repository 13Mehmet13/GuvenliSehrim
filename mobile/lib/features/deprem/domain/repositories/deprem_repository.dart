import '../models/deprem_response.dart';

abstract class IDepremRepository {
  Future<DepremResponse> getDeprem();
}
