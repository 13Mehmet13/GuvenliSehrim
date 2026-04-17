import '../models/namaz_model.dart';

abstract class INamazRepository {
  Future<NamazModel> getNamaz(String city);
}
