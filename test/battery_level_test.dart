import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_battery_meter/flutter_battery_meter.dart';
import 'package:flutter_battery_meter/battery_level_platform_interface.dart';
import 'package:flutter_battery_meter/battery_level_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryLevelPlatform
    with MockPlatformInterfaceMixin
    implements BatteryLevelPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> getBatteryLevel() async {
    // TODO: implement getBatteryLevel
    return Future.value(100);
  }
}

void main() {
  final BatteryLevelPlatform initialPlatform = BatteryLevelPlatform.instance;

  test('$MethodChannelBatteryLevel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBatteryLevel>());
  });

  test('getPlatformVersion', () async {
    BatteryLevel batteryLevelPlugin = BatteryLevel();
    MockBatteryLevelPlatform fakePlatform = MockBatteryLevelPlatform();
    BatteryLevelPlatform.instance = fakePlatform;

    expect(await batteryLevelPlugin.getPlatformVersion(), '42');
  });

  test('getPlatformVersion returns a value', () async {
    final battery = BatteryLevel();
    final version = await battery.getPlatformVersion();
    expect(version, isNotNull);
  });
}
