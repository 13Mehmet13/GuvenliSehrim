import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A simple provider that emits an integer every 60 seconds.
/// Screens can watch this to trigger periodic UI or data refreshes.
final refreshTimerProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(minutes: 1), (count) => count);
});
