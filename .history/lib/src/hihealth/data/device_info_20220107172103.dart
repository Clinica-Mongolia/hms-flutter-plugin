/*
    Copyright 2020-2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'dart:ui';

import 'package:huawei_health/src/hihealth/util/util.dart';

class DeviceInfo {
  /// Mobile phones.
  static const int TYPE_PHONE = 1;

  /// Smart scale.
  static const int TYPE_SCALES = 2;

  /// Smart watch.
  static const int TYPE_SMART_WATCH = 3;

  /// Smart band.
  static const int TYPE_SMART_BAND = 4;

  /// Smart earphones.
  static const int TYPE_SMART_EARPHONE = 5;

  /// Blood glucose monitor.
  static const int TYPE_BLOOD_GLUCOSE_MONITOR = 6;

  /// Blood pressure monitor.
  static const int TYPE_BLOOD_PRESSURE_MONITOR = 7;

  /// Heart rate monitor.
  static const int TYPE_HEART_RATE_MONITOR = 8;

  /// Unknown device.
  static const int TYPE_UNKNOWN = 0;

  /// Default platform.
  static const int PLATFORM_DEFAULT = 0;

  /// Platform other than the default one.
  static const int PLATFORM_OTHER = 2;

  /// Presentation of the phone as a string.
  static const String STR_TYPE_PHONE = "Phone";

  /// Presentation of the smart scale as a string.
  static const String STR_TYPE_SCALES = "Scales";

  /// Presentation of the smart watch as a string.
  static const String STR_TYPE_SMART_WATCH = "Smart watch";

  /// Presentation of the smart band as a string.
  static const String STR_TYPE_SMART_BAND = "Smart band";

  /// Presentation of the smart earphones as a string.
  static const String STR_TYPE_SMART_EARPHONE = "Smart earphone";

  /// Presentation of the blood glucose monitor as a string.
  static const String STR_TYPE_BLOOD_GLUCOSE_MONITOR = "Blood glucose monitor";

  /// Presentation of the blood pressure monitor as a string.
  static const String STR_TYPE_BLOOD_PRESSURE_MONITOR = "Blood pressure monitor";

  /// Presentation of the heart rate monitor as a string.
  static const String STR_TYPE_HEART_RATE_MONITOR = "Heart rate monitor";

  /// Presentation of the unknown device as a string.
  static const String STR_TYPE_UNKNOWN = "Unknown";

  /// Presentation of the error type as a string.
  static const String STR_TYPE_ERR = "error";

  String? uuid;
  String? deviceManufacturer;
  String? modelName;
  int? deviceType;
  int? platformType;
  bool? fromBleDevice;

  DeviceInfo({this.uuid, this.deviceManufacturer, this.modelName, this.deviceType, this.platformType, this.fromBleDevice});

  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(
        uuid: map['uuid'] != null ? map['uuid'] : null,
        fromBleDevice: map['fromBleDevice'] != null ? map['fromBleDevice'] : null,
        deviceManufacturer: map['deviceManufacturer'] != null ? map['deviceManufacturer'] : null,
        deviceType: map['deviceType'] != null ? map['deviceType'] : null,
        modelName: map['modelName'] != null ? map['modelName'] : null,
        platformType: map['platformType'] != null ? map['platformType'] : null);
  }

  Map<String, dynamic> toMap() {
    return {
      "uuid": uuid,
      "deviceManufacturer": deviceManufacturer,
      "modelName": modelName,
      "deviceType": deviceType,
      "platformType:": platformType,
      "fromBleDevice": fromBleDevice,
    }..removeWhere((k, v) => v == null);
  }

  String getDeviceTypeById(int deviceType) {
    switch (deviceType) {
      case 0:
        return STR_TYPE_UNKNOWN;
      case 1:
        return STR_TYPE_PHONE;
      case 2:
        return STR_TYPE_SCALES;
      case 3:
        return STR_TYPE_SMART_WATCH;
      case 4:
        return STR_TYPE_SMART_BAND;
      case 5:
        return STR_TYPE_SMART_EARPHONE;
      case 6:
        return STR_TYPE_BLOOD_GLUCOSE_MONITOR;
      case 7:
        return STR_TYPE_BLOOD_PRESSURE_MONITOR;
      case 8:
        return STR_TYPE_HEART_RATE_MONITOR;
      default:
        return STR_TYPE_ERR;
    }
  }

  int getDeviceTypeByString(String deviceType) {
    switch (deviceType) {
      case STR_TYPE_UNKNOWN:
        return 1;
      case STR_TYPE_PHONE:
        return 2;
      case STR_TYPE_SCALES:
        return 3;
      case STR_TYPE_SMART_WATCH:
        return 4;
      case STR_TYPE_SMART_BAND:
        return 5;
      case STR_TYPE_SMART_EARPHONE:
        return 6;
      case STR_TYPE_BLOOD_GLUCOSE_MONITOR:
        return 7;
      case STR_TYPE_BLOOD_PRESSURE_MONITOR:
        return 8;
      default:
        return 0;
    }
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  bool operator ==(Object other) {
    if (isTypeEqual(this, other) && other is DeviceInfo) {
      DeviceInfo compare = other;
      List<dynamic> currentArgs = [uuid, deviceManufacturer, modelName, deviceType, platformType, fromBleDevice];
      List<dynamic> otherArgs = [compare.uuid, compare.deviceManufacturer, compare.modelName, compare.deviceType, compare.platformType, compare.fromBleDevice];
      return isEquals(this, other, currentArgs, otherArgs);
    }
    return false;
  }

  @override
  int get hashCode => hashValues(uuid, deviceManufacturer, modelName, deviceType, platformType, fromBleDevice);
}
