import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/city_provider.dart';
import '../theme/app_theme.dart';
import 'glass_card.dart';
import 'city_picker_sheet.dart';
import '../constants/widget_keys.dart';

class CitySwitcher extends ConsumerWidget {
  const CitySwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityState = ref.watch(cityProvider);
    final notifier = ref.read(cityProvider.notifier);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cityState.cities.length + 1,
        itemBuilder: (context, index) {
          if (index == cityState.cities.length) {
            // Add City Button
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: GlassCard(
                borderRadius: 12,
                blur: 10,
                onTap: () => CityPickerSheet.show(context),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_rounded, color: Colors.white70, size: 20),
                ),
              ),
            );
          }

          final city = cityState.cities[index];
          final isActive = index == cityState.activeIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => notifier.setActiveCity(index),
              onLongPress: () {
                if (cityState.cities.length > 1) {
                  _showDeleteConfirm(context, ref, index, city);
                }
              },
              child: GlassCard(
                borderRadius: 15,
                blur: isActive ? 20 : 5,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isActive 
                      ? AppTheme.primaryBlue.withValues(alpha: 0.3) 
                      : Colors.white.withValues(alpha: 0.05),
                    border: Border.all(
                      color: isActive ? AppTheme.primaryBlue.withValues(alpha: 0.5) : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      city,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.white60,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context, WidgetRef ref, int index, String city) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.darkCard,
        title: const Text('Şehri Sil'),
        content: Text('$city listeden çıkarılsın mı?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              ref.read(cityProvider.notifier).removeCity(index);
              Navigator.pop(context);
            },
            child: const Text('Sil', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
