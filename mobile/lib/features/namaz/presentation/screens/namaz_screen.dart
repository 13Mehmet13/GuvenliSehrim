import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/city_picker_sheet.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain/models/namaz_model.dart';
import '../providers/namaz_provider.dart';

class NamazScreen extends ConsumerWidget {
  const NamazScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityState = ref.watch(cityProvider);
    final namazAsync = ref.watch(namazProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navNamaz,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Namaz Vakitleri', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: MeshGradientBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 40),
              _buildCitySelector(context, cityState.activeCity),
              const SizedBox(height: 30),
              namazAsync.when(
                data: (data) => _buildNamazContent(context, data),
                loading: () => _buildShimmerLoading(context),
                error: (err, stack) => _buildErrorState(context, err.toString()),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNamazContent(BuildContext context, NamazModel data) {
    return Column(
      children: [
        _buildCountdownCard(context, data.city, data.times),
        const SizedBox(height: 30),
        _buildPrayerTimesList(context, data.times),
        const SizedBox(height: 30),
        Text(
          'Metot: ${data.meta.method}',
          style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white24,
      child: Column(
        children: [
          Container(height: 180, width: double.infinity, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25))),
          const SizedBox(height: 30),
          ...List.generate(6, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(height: 60, width: double.infinity, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15))),
          )),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error_outline_rounded, size: 60, color: AppTheme.errorRed),
          const SizedBox(height: 16),
          Text('Veriler Alınamadı: $error', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildCitySelector(BuildContext context, String currentCity) {
    return GlassCard(
      key: WidgetKeys.namazSehirDropdown,
      onTap: () => CityPickerSheet.show(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            const Icon(Icons.location_on_rounded, color: AppTheme.primaryBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                currentCity,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownCard(BuildContext context, String city, NamazTimes times) {
    return GlassCard(
      key: WidgetKeys.namazKalanSure,
      color: AppTheme.primaryBlue.withValues(alpha: 0.1),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text('Sıradaki Vakit', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            const Text(
              'Öğle Vakti',
              key: WidgetKeys.namazYaklasanVakit,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              times.ogle,
              key: WidgetKeys.namazVakitText,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: -2),
            ),
            const SizedBox(height: 20),
            Text(
              city,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimesList(BuildContext context, NamazTimes times) {
    return Column(
      children: [
        _TimeRow(label: 'İmsak', time: times.imsak, icon: Icons.wb_twilight_rounded, valueKey: WidgetKeys.namazImsak),
        _TimeRow(label: 'Güneş', time: times.gunes, icon: Icons.wb_sunny_rounded, valueKey: WidgetKeys.namazGunes),
        _TimeRow(label: 'Öğle', time: times.ogle, icon: Icons.wb_sunny_rounded, isNext: true, valueKey: WidgetKeys.namazOgle),
        _TimeRow(label: 'İkindi', time: times.ikindi, icon: Icons.wb_cloudy_rounded, valueKey: WidgetKeys.namazIkindi),
        _TimeRow(label: 'Akşam', time: times.aksam, icon: Icons.nightlight_round, valueKey: WidgetKeys.namazAksam),
        _TimeRow(label: 'Yatsı', time: times.yatsi, icon: Icons.nights_stay_rounded, isLast: true, valueKey: WidgetKeys.namazYatsi),
      ],
    );
  }
}

class _TimeRow extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;
  final bool isNext;
  final bool isLast;
  final Key? valueKey;

  const _TimeRow({required this.label, required this.time, required this.icon, this.isNext = false, this.isLast = false, this.valueKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: isNext ? AppTheme.primaryBlue : Colors.grey, size: 24),
              const SizedBox(width: 16),
              Text(label, style: TextStyle(fontSize: 18, fontWeight: isNext ? FontWeight.bold : FontWeight.w500)),
              const Spacer(),
              Text(
                time,
                key: valueKey,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isNext ? AppTheme.primaryBlue : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
