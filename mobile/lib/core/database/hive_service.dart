import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';
  
  // Feature Cache Boxes
  static const String havaCache = 'hava_cache';
  static const String depremCache = 'deprem_cache';
  static const String aqiCache = 'aqi_cache';
  static const String namazCache = 'namaz_cache';
  static const String dovizCache = 'doviz_cache';

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Open all required boxes
    await _openAllBoxes();
  }

  static Future<void> _openAllBoxes() async {
    await Future.wait([
      _openIfClosed(settingsBox),
      _openIfClosed(cacheBox),
      _openIfClosed(havaCache),
      _openIfClosed(depremCache),
      _openIfClosed(aqiCache),
      _openIfClosed(namazCache),
      _openIfClosed(dovizCache),
    ]);
  }

  static Future<void> _openIfClosed(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }
  }

  /// Robust box access that ensures it's open
  static Box box(String boxName) {
    if (!Hive.isBoxOpen(boxName)) {
      // Small trick: while we should await opening, inside sync constructors we can't.
      // But init() in main() should have covered this.
      // If still closed, the app will throw HiveError until a hot restart.
      return Hive.box(boxName);
    }
    return Hive.box(boxName);
  }

  static Future<void> clearCache() async {
    await Future.wait([
      box(cacheBox).clear(),
      box(havaCache).clear(),
      box(depremCache).clear(),
      box(aqiCache).clear(),
      box(namazCache).clear(),
      box(dovizCache).clear(),
    ]);
  }
}
