import '../models/doviz_model.dart';

abstract class IDovizRepository {
  Future<DovizModel> getDoviz();
}
