import 'package:flutter/material.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:guvenli_sehrim/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guvenli_sehrim/features/deprem/presentation/screens/deprem_screen.dart';
import 'package:guvenli_sehrim/features/hava/presentation/screens/hava_screen.dart';
import 'package:guvenli_sehrim/features/aqi/presentation/screens/aqi_screen.dart';
import 'package:guvenli_sehrim/features/namaz/presentation/screens/namaz_screen.dart';
import 'package:guvenli_sehrim/features/doviz/presentation/screens/doviz_screen.dart';
import 'package:guvenli_sehrim/features/ayarlar/presentation/screens/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const DepremScreen(),
    const HavaScreen(),
    const AqiScreen(),
    const NamazScreen(),
    const DovizScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded, key: WidgetKeys.navDashboard),
            label: 'Özet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency_rounded, key: WidgetKeys.navDeprem),
            label: 'Deprem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy_rounded, key: WidgetKeys.navHava),
            label: 'Hava',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.air_rounded, key: WidgetKeys.navAqi),
            label: 'AQI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mosque_rounded, key: WidgetKeys.navNamaz),
            label: 'Namaz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_rounded, key: WidgetKeys.navDoviz),
            label: 'Döviz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded, key: WidgetKeys.navAyarlar),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}
