import 'automation.dart';
import 'consumption_area.dart';
import 'device_sensor.dart';
import 'incident.dart';

class AppData {
  final String userName;
  final String homeName;
  final int waterToday;
  final double energyToday;
  final List<double> latest24h;
  final List<DeviceSensor> gasSensors;
  final List<DeviceSensor> airQuality;
  final List<DeviceSensor> humidity;
  final List<Incident> incidents;
  final List<double> weeklyConsumption;
  final List<ConsumptionArea> consumptionAreas;
  final List<Automation> automations;

  AppData({
    required this.userName,
    required this.homeName,
    required this.waterToday,
    required this.energyToday,
    required this.latest24h,
    required this.gasSensors,
    required this.airQuality,
    required this.humidity,
    required this.incidents,
    required this.weeklyConsumption,
    required this.consumptionAreas,
    required this.automations,
  });
}