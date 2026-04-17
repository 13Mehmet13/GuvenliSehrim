class DovizModel {
  final String date;
  final List<Currency> currencies;

  DovizModel({
    required this.date,
    required this.currencies,
  });

  factory DovizModel.fromJson(Map<String, dynamic> json) {
    return DovizModel(
      date: json['date'] as String,
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Currency {
  final String code;
  final String name;
  final String buying;
  final String selling;
  final String unit;

  Currency({
    required this.code,
    required this.name,
    required this.buying,
    required this.selling,
    required this.unit,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] as String,
      name: json['name'] as String,
      buying: json['buying'] as String,
      selling: json['selling'] as String,
      unit: json['unit'] as String,
    );
  }
}
