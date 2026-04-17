import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/providers/theme_provider.dart';
import 'package:guvenli_sehrim/features/dashboard/presentation/screens/main_navigation_screen.dart';
import 'package:guvenli_sehrim/features/deprem/presentation/screens/deprem_screen.dart';
import 'package:guvenli_sehrim/features/hava/presentation/screens/hava_screen.dart';
import 'package:guvenli_sehrim/features/aqi/presentation/screens/aqi_screen.dart';
import 'package:guvenli_sehrim/features/namaz/presentation/screens/namaz_screen.dart';
import 'package:guvenli_sehrim/features/doviz/presentation/screens/doviz_screen.dart';
import 'package:guvenli_sehrim/features/ayarlar/presentation/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const ProviderScope(child: GuvenliSehrimApp()));
}

class GuvenliSehrimApp extends ConsumerWidget {
  const GuvenliSehrimApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Güvenli Şehrim',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const MainNavigationScreen(),
      routes: {
        '/deprem': (context) => const DepremScreen(),
        '/hava': (context) => const HavaScreen(),
        '/aqi': (context) => const AqiScreen(),
        '/namaz': (context) => const NamazScreen(),
        '/doviz': (context) => const DovizScreen(),
        '/ayarlar': (context) => const SettingsScreen(),
      },
    );
  }
}
