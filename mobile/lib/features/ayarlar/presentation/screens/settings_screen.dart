import 'package:flutter/material.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildSectionHeader('Görünüm'),
            _buildThemeSelector(context),
            const SizedBox(height: 30),
            _buildSectionHeader('Bildirimler'),
            _buildNotificationSection(),
            const SizedBox(height: 30),
            _buildSectionHeader('Sistem'),
            _buildSystemSection(context),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Versiyon 1.2.0 (Clean Architecture)',
                key: WidgetKeys.settingsAbout,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context) {
    return GlassCard(
      child: ListTile(
        key: WidgetKeys.settingsThemeSwitch,
        leading: const Icon(Icons.palette_rounded, color: AppTheme.primaryBlue),
        title: const Text('Tema Modu', style: TextStyle(fontWeight: FontWeight.w600)),
        trailing: DropdownButton<String>(
          value: 'Sistem',
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(value: 'Sistem', child: Text('Sistem')),
            DropdownMenuItem(value: 'Koyu', child: Text('Koyu')),
            DropdownMenuItem(value: 'Açık', child: Text('Açık')),
          ],
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildNotificationSection() {
    return GlassCard(
      key: WidgetKeys.settingsNotification,
      child: Column(
        children: [
          _buildSwitchTile(
            'Deprem Uyarıları',
            'Yüksek şiddetli sarsıntılarda bildirim al.',
            Icons.emergency_rounded,
            AppTheme.errorRed,
          ),
          Divider(color: Colors.white.withValues(alpha: 0.05), indent: 20, endIndent: 20, height: 1),
          _buildSwitchTile(
            'Hava Kalitesi Uyarıları',
            'Sağlıksız seviyelerde uyarı al.',
            Icons.air_rounded,
            AppTheme.accentCyan,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, IconData icon, Color color) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      secondary: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 20),
      ),
      value: true,
      onChanged: (val) {},
      activeThumbColor: AppTheme.primaryBlue,
    );
  }

  Widget _buildSystemSection(BuildContext context) {
    return GlassCard(
      child: Column(
        children: [
          const ListTile(
            key: WidgetKeys.settingsLanguage,
            leading: Icon(Icons.language_rounded, color: Colors.grey),
            title: Text('Dil', style: TextStyle(fontWeight: FontWeight.w600)),
            trailing: Text('Türkçe', style: TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold)),
          ),
          Divider(color: Colors.white.withValues(alpha: 0.05), indent: 20, endIndent: 20, height: 1),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.delete_sweep_rounded, color: AppTheme.errorRed),
            title: const Text('Önbelleği Temizle', style: TextStyle(color: AppTheme.errorRed, fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
