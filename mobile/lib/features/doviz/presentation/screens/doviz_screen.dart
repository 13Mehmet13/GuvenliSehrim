import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guvenli_sehrim/core/constants/widget_keys.dart';
import 'package:guvenli_sehrim/core/theme/app_theme.dart';
import 'package:guvenli_sehrim/core/widgets/glass_card.dart';
import 'package:guvenli_sehrim/core/widgets/mesh_gradient_background.dart';
import '../providers/doviz_provider.dart';
import '../../domain/models/doviz_model.dart';

class DovizScreen extends ConsumerWidget {
  const DovizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dovizAsync = ref.watch(dovizProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        key: WidgetKeys.navDoviz,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Döviz & Altın', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            key: WidgetKeys.dovizFavoriButton,
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.refresh(dovizProvider),
          ),
        ],
      ),
      body: MeshGradientBackground(
        child: dovizAsync.when(
          data: (data) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 40),
                _buildMajorRates(context, data),
                const SizedBox(height: 30),
                _buildCurrencyList(context, data),
                const SizedBox(height: 40),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, r) => Center(child: Text('Hata: $e')),
        ),
      ),
    );
  }

  Widget _buildMajorRates(BuildContext context, DovizModel data) {
    final usd = data.currencies.isNotEmpty ? data.currencies.firstWhere((c) => c.code == 'USD', 
      orElse: () => Currency(code: 'USD', name: 'USD', buying: '0', selling: '0', unit: '1')) : Currency(code: 'USD', name: 'USD', buying: '0', selling: '0', unit: '1');
    final eur = data.currencies.isNotEmpty ? data.currencies.firstWhere((c) => c.code == 'EUR', 
      orElse: () => Currency(code: 'EUR', name: 'EUR', buying: '0', selling: '0', unit: '1')) : Currency(code: 'EUR', name: 'EUR', buying: '0', selling: '0', unit: '1');

    return Row(
      children: [
        Expanded(
          child: _RateCard(
            key: WidgetKeys.dovizUsdCard,
            label: 'USD / TRY',
            value: usd.selling,
            change: '%0.00',
            isUp: true,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _RateCard(
            key: WidgetKeys.dovizEurCard,
            label: 'EUR / TRY',
            value: eur.selling,
            change: '%0.00',
            isUp: true,
          ),
        ),
      ],
    );
  }

  String _getReadableName(String code, String originalName) {
    switch (code) {
      case 'USD': return 'ABD Doları';
      case 'EUR': return 'Euro';
      case 'GBP': return 'İngiliz Sterlini';
      case 'CHF': return 'İsviçre Frangı';
      default: return originalName;
    }
  }

  Widget _buildCurrencyList(BuildContext context, DovizModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text('Tüm Kurlar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        GlassCard(
          child: ListView.separated(
            key: WidgetKeys.dovizList,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.currencies.length,
            separatorBuilder: (_, __) => Divider(color: Colors.white.withValues(alpha: 0.1), indent: 20, endIndent: 20),
            itemBuilder: (context, index) {
              final currency = data.currencies[index];
              return ListTile(
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      currency.code.substring(0, 1),
                      style: const TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                title: Text(_getReadableName(currency.code, currency.name), style: const TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text(currency.code, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${currency.selling} ₺', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('Canlı', style: TextStyle(color: AppTheme.successGreen, fontSize: 12)),
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

class _RateCard extends StatelessWidget {
  final String label;
  final String value;
  final String change;
  final bool isUp;

  const _RateCard({
    required this.label,
    required this.value,
    required this.change,
    required this.isUp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                  size: 14,
                  color: isUp ? AppTheme.successGreen : AppTheme.errorRed,
                ),
                const SizedBox(width: 4),
                Text(
                  change,
                  style: TextStyle(
                    color: isUp ? AppTheme.successGreen : AppTheme.errorRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
