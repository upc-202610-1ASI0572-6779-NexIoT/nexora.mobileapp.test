import 'package:flutter/material.dart';

import '../models/app_data.dart';
import '../models/consumption_area.dart';
import '../models/device_sensor.dart';
import '../models/incident.dart';

class FakeNexoraApi {
  Future<AppData> getDashboardData() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return AppData(
      userName: 'María Castillo',
      homeName: 'San Isidro House',
      waterToday: 284,
      energyToday: 6.2,
      latest24h: [
        8,
        12,
        10,
        15,
        19,
        30,
        42,
        28,
        20,
        14,
        9,
        16,
        24,
        31,
        27,
        20,
        15,
        10,
        8,
        12,
      ],
      gasSensors: [
        DeviceSensor('Kitchen', 'Floor 1', 'No leaks detected', false),
        DeviceSensor('Basement', 'Basement 1', 'No leaks detected', false),
        DeviceSensor('Kitchen', 'Floor 2', 'Leak detected', true),
      ],
      airQuality: [
        DeviceSensor('Habitación 1', 'Floor 1', '100 %', false),
        DeviceSensor('Dinning Room', 'Floor 2', '95 %', false),
        DeviceSensor('Kitchen', 'Floor 2', '93 %', false),
      ],
      humidity: [
        DeviceSensor('Living Room', 'Floor 1', '60 %', false),
        DeviceSensor('Garage', 'Floor 1', '87 %', false),
      ],
      incidents: [
        Incident(
          'Water Leak Detected',
          'Kitchen • 5 mins ago',
          '10:45 AM',
          'Active',
          IncidentLevel.critical,
          Icons.water_drop_outlined,
        ),
        Incident(
          'Power Surge',
          'Main Panel • 12 mins ago',
          '09:12 AM',
          'Active',
          IncidentLevel.critical,
          Icons.bolt_outlined,
        ),
        Incident(
          'Motion in Backyard',
          'External Gate • 1h ago',
          'Yesterday',
          'Pend.',
          IncidentLevel.warning,
          Icons.home_outlined,
        ),
        Incident(
          'Unusual Energy Spike',
          'Whole House • 2h ago',
          'Oct 22',
          'Pend.',
          IncidentLevel.warning,
          Icons.videocam_outlined,
        ),
      ],
      weeklyConsumption: [
        980,
        1220,
        1140,
        1320,
        1490,
        1280,
        1560,
        1420,
        1250,
        1180,
        1390,
        1647,
      ],
      consumptionAreas: [
        ConsumptionArea('Master bathroom', 624),
        ConsumptionArea('Kitchen', 498),
        ConsumptionArea('Laundry', 412),
        ConsumptionArea('Secondary bathroom', 313),
      ],
    );
  }
}