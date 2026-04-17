import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/features/dashboard/presentation/screens/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Local DB
  await HiveService.init();

  runApp(
    const ProviderScope(
      child: GuvenliSehrimApp(),
    ),
  );
}

class GuvenliSehrimApp extends ConsumerWidget {
  const GuvenliSehrimApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, listen to a theme provider
    const themeMode = ThemeMode.system;

    return MaterialApp(
      title: 'Güvenli Şehrim',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const MainNavigationScreen(),
    );
  }
}
