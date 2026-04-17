import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/providers/city_provider.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import 'package:guvenli_sehrim/core/widgets/city_switcher.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:guvenli_sehrim/features/hava/presentation/providers/hava_provider.dart';
import 'package:guvenli_sehrim/features/namaz/presentation/providers/namaz_provider.dart';
import 'package:guvenli_sehrim/features/aqi/presentation/providers/aqi_provider.dart';
import 'package:guvenli_sehrim/features/doviz/presentation/providers/doviz_provider.dart';
import 'package:guvenli_sehrim/features/deprem/presentation/providers/deprem_provider.dart';
import 'package:guvenli_sehrim/features/doviz/domain/models/doviz_model.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cityState = ref.watch(cityProvider);

    return Scaffold(
      body: MeshGradientBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 180,
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Güvenli Şehrim',
                      key: WidgetKeys.dashboardKonumText,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cityState.activeCity,
                      style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.primaryBlue).withValues(alpha: 0.6),
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: GlassCard(
                      borderRadius: 12,
                      blur: 10,
                      child: IconButton(
                        key: WidgetKeys.dashboardRefresh,
                        icon: const Icon(Icons.refresh_rounded),
                        onPressed: () {
                          _animController.reset();
                          _animController.forward();
                          ref.invalidate(havaProvider);
                          ref.invalidate(namazProvider);
                          ref.invalidate(aqiProvider);
                          ref.invalidate(dovizProvider);
                          ref.invalidate(depremProvider);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: CitySwitcher(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildBentoGrid(context),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBentoGrid(BuildContext context) {
    final hava = ref.watch(havaProvider);
    final aqi = ref.watch(aqiProvider);
    final deprem = ref.watch(depremProvider);
    final namaz = ref.watch(namazProvider);
    final doviz = ref.watch(dovizProvider);

    return Column(
      children: [
        // 1. Earthquake (Large 2x1)
        _buildAnimatedBentoItem(
          delay: 0,
          child: GlassCard(
            key: WidgetKeys.dashboardDepremCard,
            height: 180,
            onTap: () => Navigator.pushNamed(context, '/deprem'),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: deprem.when(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        _buildBadge(Icons.emergency_rounded, AppTheme.errorRed, 'DEPREM'),
                        const Spacer(),
                        const Icon(Icons.chevron_right_rounded, color: Colors.grey, size: 20),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data.earthquakes.isNotEmpty ? '${data.earthquakes.first.mag} Mw' : 'Sakin',
                      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.earthquakes.isNotEmpty ? data.earthquakes.first.title : 'Şu an riskli bir sarsıntı yok.',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Hata: $e')),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // 2. Weather & AQI
        Row(
          children: [
            Expanded(
              child: _buildAnimatedBentoItem(
                delay: 200,
                child: GlassCard(
                  key: WidgetKeys.dashboardHavaCard,
                  height: 170,
                  onTap: () => Navigator.pushNamed(context, '/hava'),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: hava.when(
                      data: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIconBox(Icons.wb_sunny_rounded, Colors.orange),
                          const Spacer(),
                          Text('${data.current.temp.round()}°', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold), key: WidgetKeys.havaTempText),
                          Text(data.current.condition, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 1),
                        ],
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => const Center(child: Icon(Icons.error_outline)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAnimatedBentoItem(
                delay: 400,
                child: GlassCard(
                  key: WidgetKeys.dashboardAqiCard,
                  height: 170,
                  onTap: () => Navigator.pushNamed(context, '/aqi'),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: aqi.when(
                      data: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIconBox(Icons.air_rounded, AppTheme.successGreen),
                          const Spacer(),
                          Text(data.aqi.toString(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold), key: WidgetKeys.aqiValueText),
                          Text(data.status, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 1, key: WidgetKeys.aqiStatusText),
                        ],
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => const Center(child: Icon(Icons.error_outline)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // 3. Prayer & Currency
        Row(
          children: [
            Expanded(
              child: _buildAnimatedBentoItem(
                delay: 600,
                child: GlassCard(
                  key: WidgetKeys.dashboardNamazCard,
                  height: 170,
                  onTap: () => Navigator.pushNamed(context, '/namaz'),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: namaz.when(
                      data: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIconBox(Icons.mosque_rounded, Colors.orange),
                          const Spacer(),
                          Text(data.times.ogle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), key: WidgetKeys.namazOgleVakti),
                          const Text('Öğle Vakti', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => const Center(child: Icon(Icons.error_outline)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAnimatedBentoItem(
                delay: 800,
                child: GlassCard(
                  key: WidgetKeys.dashboardDovizCard,
                  height: 170,
                  onTap: () => Navigator.pushNamed(context, '/doviz'),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: doviz.when(
                      data: (data) {
                        final currencies = (data as DovizModel?)?.currencies;
                        final usd = currencies != null && currencies.isNotEmpty 
                            ? currencies.firstWhere((c) => c.code == 'USD', orElse: () => Currency(code: 'USD', name: 'USD', buying: '0', selling: '0', unit: '1')) 
                            : null;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildIconBox(Icons.currency_exchange_rounded, Colors.purple),
                            const Spacer(),
                            Text(usd != null ? '${usd.selling} ₺' : '-', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const Text('Dolar (USD)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => const Center(child: Icon(Icons.error_outline)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnimatedBentoItem({required double delay, required Widget child}) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, _) {
        final double progress = _animController.value;
        final double start = delay / 1000;
        final double end = (delay + 400) / 1000;
        final double effectiveProgress = ((progress - start) / (end - start)).clamp(0.0, 1.0);
        
        final curve = Curves.easeOutBack.transform(effectiveProgress);

        return Opacity(
          opacity: effectiveProgress,
          child: Transform.scale(
            scale: 0.8 + (0.2 * curve),
            child: Transform.translate(
              offset: Offset(0, 30 * (1 - curve)),
              child: child,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(IconData icon, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildIconBox(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
