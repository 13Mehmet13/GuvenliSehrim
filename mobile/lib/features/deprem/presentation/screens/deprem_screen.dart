import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import '../providers/deprem_provider.dart';
import '../../domain/models/deprem_response.dart';
import '../../domain/models/deprem_model.dart';

class DepremScreen extends ConsumerWidget {
  const DepremScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final depremAsync = ref.watch(depremProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navDeprem,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Son Depremler', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: MeshGradientBackground(
        child: depremAsync.when(
          data: (data) {
            if (data.earthquakes.isEmpty) {
              return const Center(child: Text('Şu an gösterilecek bir deprem verisi bulunamadı.'));
            }
            return Column(
              children: [
                _buildMapHeader(context, data.earthquakes),
                _buildStatsSection(context, data),
                Expanded(child: _buildEarthquakeList(context, data.earthquakes)),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(key: WidgetKeys.depremMap)),
          error: (e, r) => Center(child: Text('Hata: $e')),
        ),
      ),
    );
  }

  Widget _buildMapHeader(BuildContext context, List<DepremModel> earthquakes) {
    final firstPoint = earthquakes.isNotEmpty 
        ? LatLng(earthquakes.first.lat, earthquakes.first.lng)
        : const LatLng(39.0, 35.0);

    return Container(
      key: WidgetKeys.depremMap,
      height: 300,
      margin: const EdgeInsets.only(top: kToolbarHeight + 40, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: firstPoint,
            initialZoom: 5.5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.bmu1422.guvenli_sehrim',
            ),
            MarkerLayer(
              markers: earthquakes.take(30).map((deprem) {
                final color = deprem.mag >= 4.0 ? AppTheme.errorRed : AppTheme.warningOrange;
                return Marker(
                  point: LatLng(deprem.lat, deprem.lng),
                  width: 50,
                  height: 50,
                  child: _PulseMarker(magnitude: deprem.mag, color: color),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, DepremResponse data) {
    final mag4Plus = data.earthquakes.where((e) => e.mag >= 4.0).length;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GlassCard(
        key: WidgetKeys.depremStatsCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(label: 'Son 24s', value: data.earthquakes.length.toString(), color: AppTheme.primaryBlue),
              _StatItem(label: '4.0+ Üzeri', value: mag4Plus.toString(), color: AppTheme.errorRed),
              _StatItem(label: 'Kandilli', value: 'Canlı', color: AppTheme.successGreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEarthquakeList(BuildContext context, List<DepremModel> earthquakes) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: earthquakes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final deprem = earthquakes[index];
        final isMajor = deprem.mag >= 4.0;
        
        return GlassCard(
          borderRadius: 20,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: (isMajor ? AppTheme.errorRed : AppTheme.warningOrange).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  deprem.mag.toString(),
                  style: TextStyle(
                    color: isMajor ? AppTheme.errorRed : AppTheme.warningOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            title: Text(deprem.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('${deprem.date} • ${deprem.depth} km', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ),
            trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class _PulseMarker extends StatefulWidget {
  final double magnitude;
  final Color color;
  const _PulseMarker({required this.magnitude, required this.color});

  @override
  State<_PulseMarker> createState() => _PulseMarkerState();
}

class _PulseMarkerState extends State<_PulseMarker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30 + (20 * _controller.value),
              height: 30 + (20 * _controller.value),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.3 * (1 - _controller.value)),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(color: widget.color.withValues(alpha: 0.5), blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: Center(
                child: Text(
                  widget.magnitude.toString(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatItem({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
