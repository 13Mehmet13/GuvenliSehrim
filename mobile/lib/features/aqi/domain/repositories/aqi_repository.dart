import '../models/aqi_model.dart';

abstract class IAqiRepository {
  Future<AqiModel> getAqi(String city);
}
