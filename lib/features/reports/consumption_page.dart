import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../code/theme/app_colors.dart';
import '../../code/widgets/chip_label.dart';
import '../../code/widgets/line_chart.dart';
import '../../code/widgets/section_label.dart';
import '../../code/widgets/top_bar.dart';
import '../../code/widgets/white_card.dart';
import '../../data/models/app_data.dart';

class ConsumptionPage extends StatelessWidget {
  final AppData data;

  const ConsumptionPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final maxLitres = data.consumptionAreas
        .map((area) => area.litres)
        .reduce(math.max);

    return Column(
      children: [
        const TopBar(
          title: 'Consumption',
          actionIcon: Icons.filter_alt_outlined,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 24),
            child: Column(
              children: [
                const _SegmentControl(),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    ChipLabel('Day'),
                    SizedBox(width: 8),
                    ChipLabel('Week', selected: true),
                    SizedBox(width: 8),
                    ChipLabel('Month'),
                    SizedBox(width: 8),
                    ChipLabel('Year'),
                  ],
                ),
                const SizedBox(height: 12),
                WhiteCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'THIS WEEK',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '⚠ High Usage Alert',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '1,847',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Text(
                              'litres',
                              style: TextStyle(
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '↑ 14% vs last week',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 125,
                        child: LineChart(
                          values: data.weeklyConsumption,
                          showGrid: true,
                          showLastDot: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'M',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'T',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'W',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'T',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'F',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'S',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'S',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SectionLabel('DETAIL BY AREA'),
                ),
                const SizedBox(height: 8),
                WhiteCard(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  child: Column(
                    children: data.consumptionAreas.map((area) {
                      final percent = area.litres / maxLitres;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    area.area,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${area.litres} L',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: percent,
                                minHeight: 4,
                                color: AppColors.blue,
                                backgroundColor: AppColors.border,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SegmentControl extends StatelessWidget {
  const _SegmentControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F1EA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 14,
                    color: AppColors.blue,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Water',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bolt,
                    size: 14,
                    color: AppColors.muted,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Electricity',
                    style: TextStyle(
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}