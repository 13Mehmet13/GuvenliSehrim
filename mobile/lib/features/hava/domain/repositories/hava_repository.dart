import '../models/hava_model.dart';

abstract class IHavaRepository {
  Future<HavaModel> getHava(String city);
}
