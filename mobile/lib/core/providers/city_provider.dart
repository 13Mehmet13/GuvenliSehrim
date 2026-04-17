import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../database/hive_service.dart';

class CityState {
  final List<String> cities;
  final int activeIndex;

  CityState({required this.cities, required this.activeIndex});

  String get activeCity => cities.isEmpty ? 'İstanbul' : cities[activeIndex];

  CityState copyWith({List<String>? cities, int? activeIndex}) {
    return CityState(
      cities: cities ?? this.cities,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }
}

final cityProvider = StateNotifierProvider<CityNotifier, CityState>((ref) {
  return CityNotifier();
});

class CityNotifier extends StateNotifier<CityState> {
  CityNotifier() : super(CityState(cities: ['İstanbul'], activeIndex: 0)) {
    _loadCities();
  }

  void _loadCities() {
    final box = Hive.box(HiveService.settingsBox);
    final List<String> savedCities = List<String>.from(box.get('saved_cities', defaultValue: ['İstanbul']));
    final int savedIndex = box.get('active_city_index', defaultValue: 0);
    
    state = CityState(
      cities: savedCities.isEmpty ? ['İstanbul'] : savedCities,
      activeIndex: savedIndex < savedCities.length ? savedIndex : 0,
    );
  }

  String get normalizedCity {
    return state.activeCity.toLowerCase()
      .replaceAll('ı', 'i')
      .replaceAll('ü', 'u')
      .replaceAll('ş', 's')
      .replaceAll('ö', 'o')
      .replaceAll('ç', 'c')
      .replaceAll('ğ', 'g');
  }

  Future<void> addCity(String city) async {
    if (state.cities.contains(city)) {
      final index = state.cities.indexOf(city);
      await setActiveCity(index);
      return;
    }

    final newCities = [...state.cities, city];
    state = state.copyWith(cities: newCities, activeIndex: newCities.length - 1);
    await _saveToHive();
  }

  Future<void> removeCity(int index) async {
    if (state.cities.length <= 1) return; // En az bir şehir kalmalı

    final newCities = List<String>.from(state.cities)..removeAt(index);
    int newActiveIndex = state.activeIndex;
    
    if (newActiveIndex >= newCities.length) {
      newActiveIndex = newCities.length - 1;
    }

    state = CityState(cities: newCities, activeIndex: newActiveIndex);
    await _saveToHive();
  }

  Future<void> setActiveCity(int index) async {
    if (index < 0 || index >= state.cities.length) return;
    state = state.copyWith(activeIndex: index);
    await _saveToHive();
  }

  Future<void> _saveToHive() async {
    final box = Hive.box(HiveService.settingsBox);
    await box.put('saved_cities', state.cities);
    await box.put('active_city_index', state.activeIndex);
  }
}
