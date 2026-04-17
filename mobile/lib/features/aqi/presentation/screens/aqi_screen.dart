import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain/models/aqi_model.dart';
import '../providers/aqi_provider.dart';

class AqiScreen extends ConsumerWidget {
  const AqiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityState = ref.watch(cityProvider);
    final aqiAsync = ref.watch(aqiProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navAqi,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hava Kalitesi', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: MeshGradientBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 40),
              _buildCityHeader(context, cityState.activeCity),
              const SizedBox(height: 30),
              aqiAsync.when(
                data: (data) => _buildAqiContent(context, data),
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

  Widget _buildAqiContent(BuildContext context, AqiModel data) {
    return Column(
      children: [
        _buildAqiCard(context, data),
        const SizedBox(height: 30),
        _buildPollutantsList(context, data.pollutants),
        const SizedBox(height: 30),
        _buildHealthAdvice(context, data),
      ],
    );
  }

  Widget _buildShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white24,
      child: Column(
        children: [
          Container(height: 250, width: 250, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
          const SizedBox(height: 30),
          Container(height: 150, width: double.infinity, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20))),
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

  Widget _buildCityHeader(BuildContext context, String city) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_on_rounded, color: AppTheme.primaryBlue, size: 20),
            const SizedBox(width: 8),
            Text(city, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildAqiCard(BuildContext context, AqiModel data) {
    final statusColor = Color(int.parse(data.color.replaceAll('#', '0xFF')));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppTheme.darkCard.withValues(alpha: 0.5),
        shape: BoxShape.circle,
        border: Border.all(color: statusColor.withValues(alpha: 0.3), width: 8),
        boxShadow: [
          BoxShadow(
            color: statusColor.withValues(alpha: 0.1),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.aqi.toString(),
            key: WidgetKeys.aqiValueText,
            style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: statusColor),
          ),
          Text(
            data.status.toUpperCase(),
            key: WidgetKeys.aqiStatusText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: statusColor, letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildPollutantsList(BuildContext context, Pollutants pollutants) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kirleticiler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _PollutantRow(label: 'PM10', value: '${pollutants.pm10} µg/m³', valueKey: WidgetKeys.aqiPm10),
            _PollutantRow(label: 'PM2.5', value: '${pollutants.pm25} µg/m³', valueKey: WidgetKeys.aqiPm25),
            _PollutantRow(label: 'NO2', value: '${pollutants.no2} µg/m³', valueKey: WidgetKeys.aqiNo2),
            _PollutantRow(label: 'SO2', value: '${pollutants.so2} µg/m³', valueKey: WidgetKeys.aqiSo2),
            _PollutantRow(label: 'O3', value: '${pollutants.o3} µg/m³', valueKey: WidgetKeys.aqiO3),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthAdvice(BuildContext context, AqiModel data) {
    final statusColor = Color(int.parse(data.color.replaceAll('#', '0xFF')));
    
    return GlassCard(
      key: WidgetKeys.aqiOneriCard,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: statusColor.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(Icons.info_rounded, color: statusColor),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                data.description,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PollutantRow extends StatelessWidget {
  final String label;
  final String value;
  final Key? valueKey;

  const _PollutantRow({required this.label, required this.value, this.valueKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), key: valueKey),
        ],
      ),
    );
  }
}
