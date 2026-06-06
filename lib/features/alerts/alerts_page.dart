import 'package:flutter/material.dart';

import '../../code/theme/app_colors.dart';
import '../../code/widgets/top_bar.dart';
import '../../code/widgets/white_card.dart';
import '../../data/models/app_data.dart';
import '../../data/models/incident.dart';

class AlertsPage extends StatelessWidget {
  final AppData data;

  const AlertsPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBar(
          title: 'Incidents Center',
          actionIcon: Icons.search,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10, 22, 10, 24),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: _IncidentSummaryCard(
                        title: 'Critical',
                        icon: Icons.error_outline,
                        color: AppColors.orange,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _IncidentSummaryCard(
                        title: 'Warning',
                        icon: Icons.warning_amber_outlined,
                        color: Color(0xFFE7B83E),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _IncidentSummaryCard(
                        title: 'Solved',
                        icon: Icons.check_circle_outline,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  children: const [
                    Text(
                      'All • 17',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Active • 6',
                      style: TextStyle(
                        color: AppColors.muted,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Solved',
                      style: TextStyle(
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(
                  color: AppColors.text,
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                ...data.incidents.map((incident) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: _IncidentCard(incident: incident),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IncidentSummaryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _IncidentSummaryCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final Incident incident;

  const _IncidentCard({
    required this.incident,
  });

  @override
  Widget build(BuildContext context) {
    final isCritical = incident.level == IncidentLevel.critical;

    return WhiteCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDF5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              incident.icon,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: isCritical
                            ? AppColors.orange
                            : const Color(0xFFE7B83E),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        isCritical ? 'CRIT' : 'WARN',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      incident.time,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  incident.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  incident.subtitle,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            incident.status,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}