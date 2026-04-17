import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:guvenli_sehrim/core/database/hive_service.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/providers/theme_provider.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/constants/cities.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final cityState = ref.watch(cityProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navSettings,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Ayarlar', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: MeshGradientBackground(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight + 40),

            // ── TEMA ──────────────────────────────────────────────────────
            _sectionHeader('Görünüm'),
            GlassCard(
              key: WidgetKeys.settingsThemeSwitch,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _ThemeTile(
                      label: 'Sistem Temasını Kullan',
                      icon: Icons.brightness_auto_rounded,
                      selected: themeMode == ThemeMode.system,
                      onTap: () => ref.read(themeProvider.notifier).setTheme(ThemeMode.system),
                    ),
                    _divider,
                    _ThemeTile(
                      label: 'Açık Tema',
                      icon: Icons.wb_sunny_rounded,
                      selected: themeMode == ThemeMode.light,
                      onTap: () => ref.read(themeProvider.notifier).setTheme(ThemeMode.light),
                    ),
                    _divider,
                    _ThemeTile(
                      label: 'Koyu Tema',
                      icon: Icons.nightlight_round,
                      selected: themeMode == ThemeMode.dark,
                      onTap: () => ref.read(themeProvider.notifier).setTheme(ThemeMode.dark),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ── ŞEHİRLER ─────────────────────────────────────────────────
            _sectionHeader('Şehir Yönetimi'),
            GlassCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    // Active cities list
                    ...cityState.cities.asMap().entries.map((entry) {
                      final i = entry.key;
                      final city = entry.value;
                      final isActive = i == cityState.activeIndex;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () => ref.read(cityProvider.notifier).setActiveCity(i),
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppTheme.primaryBlue.withValues(alpha: 0.15)
                                    : Colors.grey.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                isActive ? Icons.location_on_rounded : Icons.location_off_rounded,
                                color: isActive ? AppTheme.primaryBlue : Colors.grey,
                                size: 20,
                              ),
                            ),
                            title: Text(
                              city,
                              style: TextStyle(
                                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                                color: isActive ? AppTheme.primaryBlue : null,
                              ),
                            ),
                            subtitle: isActive
                                ? const Text('Aktif Şehir', style: TextStyle(fontSize: 11, color: AppTheme.primaryBlue))
                                : null,
                            trailing: cityState.cities.length > 1
                                ? IconButton(
                                    icon: const Icon(Icons.delete_rounded, color: Colors.redAccent, size: 20),
                                    onPressed: () => _confirmRemove(context, i, city),
                                  )
                                : null,
                          ),
                          if (i < cityState.cities.length - 1) _divider,
                        ],
                      );
                    }),
                    _divider,
                    // Add city button
                    ListTile(
                      onTap: () => _showCityPicker(context),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.successGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add_location_alt_rounded, color: AppTheme.successGreen, size: 20),
                      ),
                      title: const Text('Şehir Ekle', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.successGreen)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ── SİSTEM ───────────────────────────────────────────────────
            _sectionHeader('Sistem'),
            GlassCard(
              key: WidgetKeys.settingsNotification,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      key: WidgetKeys.settingsLanguage,
                      leading: const Icon(Icons.language_rounded, color: Colors.grey),
                      title: const Text('Uygulama Dili', style: TextStyle(fontWeight: FontWeight.w600)),
                      trailing: const Text('Türkçe', style: TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold)),
                    ),
                    _divider,
                    ListTile(
                      onTap: _clearCache,
                      leading: const Icon(Icons.delete_sweep_rounded, color: AppTheme.errorRed),
                      title: const Text('Önbelleği Temizle', style: TextStyle(color: AppTheme.errorRed, fontWeight: FontWeight.w600)),
                      subtitle: const Text('Tüm önbelleğe alınan veriler silinir.', style: TextStyle(fontSize: 11)),
                      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              key: WidgetKeys.settingsAbout,
              child: Text(
                'Güvenli Şehrim v1.2.0\nClean Architecture Edition',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.6),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget get _divider => Divider(
    color: Colors.white.withValues(alpha: 0.07),
    indent: 20,
    endIndent: 20,
    height: 1,
  );

  void _clearCache() async {
    await HiveService.clearCache();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Önbellek başarıyla temizlendi ✓'),
        backgroundColor: AppTheme.successGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _confirmRemove(BuildContext context, int index, String city) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Şehri Kaldır'),
        content: Text('"$city" şehrini listeden kaldırmak istiyor musun?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('İptal')),
          TextButton(
            onPressed: () {
              ref.read(cityProvider.notifier).removeCity(index);
              Navigator.pop(ctx);
            },
            child: const Text('Kaldır', style: TextStyle(color: AppTheme.errorRed)),
          ),
        ],
      ),
    );
  }

  void _showCityPicker(BuildContext context) {
    String search = '';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setStateModal) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 16),
              const Text('Şehir Seç', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Şehir ara...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  onChanged: (v) => setStateModal(() => search = v),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: trCities
                      .where((c) => c.toLowerCase().contains(search.toLowerCase()))
                      .map((city) => ListTile(
                            title: Text(city),
                            onTap: () {
                              ref.read(cityProvider.notifier).addCity(city);
                              Navigator.pop(ctx);
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: selected ? AppTheme.primaryBlue : Colors.grey),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? AppTheme.primaryBlue : null,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_circle_rounded, color: AppTheme.primaryBlue)
          : const Icon(Icons.radio_button_unchecked_rounded, color: Colors.grey),
    );
  }
}
