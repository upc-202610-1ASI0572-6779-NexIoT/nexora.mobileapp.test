import 'package:flutter/material.dart';

import '../../code/theme/app_colors.dart';
import '../../code/widgets/chip_label.dart';
import '../../code/widgets/section_label.dart';
import '../../code/widgets/top_bar.dart';
import '../../code/widgets/white_card.dart';
import '../../data/models/app_data.dart';
import '../../data/models/device_sensor.dart';

class DevicesPage extends StatelessWidget {
  final AppData data;

  const DevicesPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBar(
          title: 'Devices',
          actionIcon: Icons.search,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(14, 20, 14, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _AutomationCard(),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    ChipLabel('All (12)', selected: true),
                    SizedBox(width: 8),
                    ChipLabel('Bedroom (4)'),
                    SizedBox(width: 8),
                    ChipLabel('Kitchen (3)'),
                  ],
                ),
                const SizedBox(height: 28),
                _DeviceSection(
                  title: 'GAS SENSOR',
                  icon: Icons.sensor_occupied_outlined,
                  items: data.gasSensors,
                  alertIcon: Icons.warning_rounded,
                ),
                const SizedBox(height: 24),
                _DeviceSection(
                  title: 'AIR QUALITY',
                  icon: Icons.air,
                  items: data.airQuality,
                ),
                const SizedBox(height: 24),
                _DeviceSection(
                  title: 'HUMIDITY',
                  icon: Icons.water_drop_outlined,
                  items: data.humidity,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AutomationCard extends StatelessWidget {
  const _AutomationCard();

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: SizedBox(
        height: 78,
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AUTOMATIONS',
                      style: TextStyle(
                        color: AppColors.muted,
                        letterSpacing: 1.2,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '5 Active',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.orange,
                          size: 7,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'System optimizing energy usage',
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.sensors_outlined,
              size: 74,
              color: AppColors.blue.withOpacity(0.08),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeviceSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? alertIcon;
  final List<DeviceSensor> items;

  const _DeviceSection({
    required this.title,
    required this.icon,
    required this.items,
    this.alertIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title),
        const SizedBox(height: 10),
        WhiteCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: items.map((item) {
              final isLast = items.last == item;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: item.alert
                                ? const Color(0xFFFFE6E6)
                                : const Color(0xFFF0F2FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            item.alert
                                ? alertIcon ?? Icons.warning_rounded
                                : icon,
                            color: item.alert
                                ? AppColors.red
                                : AppColors.blue,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                item.subtitle,
                                style: const TextStyle(
                                  color: AppColors.muted,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item.value,
                          style: TextStyle(
                            color: item.alert
                                ? AppColors.red
                                : AppColors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: item.value.contains('%') ? 18 : 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      color: AppColors.border,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}