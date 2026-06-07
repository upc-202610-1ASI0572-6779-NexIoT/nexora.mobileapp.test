import 'automation.dart';
import 'consumption_view.dart';
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
  final Map<ConsumptionMetric, Map<ConsumptionRange, ConsumptionView>>
      consumption;
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
    required this.consumption,
    required this.automations,
  });
}