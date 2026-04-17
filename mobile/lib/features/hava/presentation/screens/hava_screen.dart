import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/city_picker_sheet.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain/models/hava_model.dart';
import '../providers/hava_provider.dart';

class HavaScreen extends ConsumerWidget {
  const HavaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityState = ref.watch(cityProvider);
    final havaAsync = ref.watch(havaProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navHava,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hava Durumu', style: TextStyle(fontWeight: FontWeight.bold)),
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
              havaAsync.when(
                data: (data) => _buildWeatherData(context, data),
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

  Widget _buildWeatherData(BuildContext context, HavaModel data) {
    return Column(
      children: [
        _buildCurrentWeather(context, data.city, data.current),
        const SizedBox(height: 40),
        _buildWeatherDetails(context, data.current),
        const SizedBox(height: 30),
        _build5DayForecast(context, data.forecast),
      ],
    );
  }

  Widget _buildShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white24,
      child: Column(
        children: [
          Container(height: 150, width: 150, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
          const SizedBox(height: 20),
          Container(height: 40, width: 100, color: Colors.white),
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
      key: WidgetKeys.havaSehirDropdown,
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

  Widget _buildCurrentWeather(BuildContext context, String city, HavaCurrent current) {
    return Column(
      children: [
        _WeatherIcon(condition: current.condition, size: 120),
        const SizedBox(height: 16),
        Text(
          '${current.temp.round()}°',
          key: WidgetKeys.havaTempText,
          style: const TextStyle(fontSize: 90, fontWeight: FontWeight.bold, letterSpacing: -4),
        ),
        Text(
          current.condition,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails(BuildContext context, HavaCurrent current) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _DetailItem(icon: Icons.water_drop_rounded, label: 'Nem', value: '%${current.humidity}', color: Colors.blue, valueKey: WidgetKeys.havaNemText),
            _DetailItem(icon: Icons.air_rounded, label: 'Rüzgar', value: '${current.wind} km/h', color: Colors.teal, valueKey: WidgetKeys.havaRuzgarText),
            _DetailItem(icon: Icons.thermostat_rounded, label: 'Hissedilen', value: '${current.feelsLike.round()}°', color: Colors.orange, valueKey: WidgetKeys.havaHissedilenText),
          ],
        ),
      ),
    );
  }

  Widget _build5DayForecast(BuildContext context, List<HavaForecast> forecast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text('5 Günlük Tahmin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        GlassCard(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: forecast.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            separatorBuilder: (_, __) => Divider(color: Colors.white.withValues(alpha: 0.1), indent: 20, endIndent: 20),
            itemBuilder: (context, index) {
              final day = forecast[index];
              return ListTile(
                leading: _WeatherIcon(condition: day.condition, size: 28),
                title: Text(day.date, style: const TextStyle(fontWeight: FontWeight.w500)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${day.min.round()}°', style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 12),
                    Text('${day.max.round()}°', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  final String condition;
  final double size;
  const _WeatherIcon({required this.condition, required this.size});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.wb_cloudy_rounded;
    Color color = Colors.blueAccent;

    if (condition.contains('Güneşli') || condition.contains('Açık')) {
      icon = Icons.wb_sunny_rounded;
      color = Colors.orange;
    } else if (condition.contains('Yağmur') || condition.contains('Sağanak')) {
      icon = Icons.beach_access_rounded;
      color = Colors.blue;
    } else if (condition.contains('Kar')) {
      icon = Icons.ac_unit_rounded;
      color = Colors.lightBlueAccent;
    } else if (condition.contains('Bulutlu')) {
      icon = Icons.cloud_rounded;
      color = Colors.grey;
    }

    return Icon(icon, color: color, size: size);
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Key? valueKey;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), key: valueKey),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
