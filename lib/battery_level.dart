import 'battery_level_platform_interface.dart';

class BatteryLevel {
  Future<String?> getPlatformVersion() {
    return BatteryLevelPlatform.instance.getPlatformVersion();
  }

  Future<int?> getBatteryLevel() {
    return BatteryLevelPlatform.instance.getBatteryLevel();
  }
}
