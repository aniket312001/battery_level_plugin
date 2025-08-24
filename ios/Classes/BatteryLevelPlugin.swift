import Flutter
import UIKit

public class BatteryLevelPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_level", binaryMessenger: registrar.messenger())
    let instance = BatteryLevelPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)

    case "getBatteryLevel":
      result(getBatteryLevel())

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getBatteryLevel() -> Int {
    UIDevice.current.isBatteryMonitoringEnabled = true
    let batteryLevel = UIDevice.current.batteryLevel
    if batteryLevel == -1 {
      return -1 // unavailable
    } else {
      return Int(batteryLevel * 100)
    }
  }
}
