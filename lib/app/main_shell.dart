import 'package:flutter/material.dart';

import '../code/theme/app_colors.dart';
import '../data/models/app_data.dart';
import '../features/alerts/alerts_page.dart';
import '../features/devices/devices_page.dart';
import '../features/home/home_page.dart';
import '../features/profile/profile_page.dart';
import '../features/reports/consumption_page.dart';

class MainShell extends StatefulWidget {
  final AppData data;

  const MainShell({
    super.key,
    required this.data,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(data: widget.data),
      DevicesPage(data: widget.data),
      AlertsPage(data: widget.data),
      ConsumptionPage(data: widget.data),
      ProfilePage(data: widget.data),
    ];

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.muted,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows_outlined),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_outlined),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}