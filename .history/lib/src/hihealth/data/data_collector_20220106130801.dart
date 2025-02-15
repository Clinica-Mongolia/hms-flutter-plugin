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

import 'package:flutter/material.dart';
import 'package:huawei_health/src/hihealth/data/data_export.dart';
import 'package:huawei_health/src/hihealth/util/util.dart';

/// Defines a unique data collector.
///
/// A data collector provides the raw data collected from a phone or external
/// device. Data from multiple data collectors can be converted or combined and
/// therefore becomes derived data. Each sampling point must have a corresponding
/// data collector.
///
/// When a data collector is created, a unique identifier will be generated for it.
/// The identifier consists of the data collector type, device information, package
/// name of the app, and more.
class DataCollector {
  /// Constants ///
  /// //////// ///

  /// Other data collectors.
  static const String EXTRA_DATA_SOURCE = "vnd.huawei.hihealth.data_collector";

  /// Quality standard for blood pressure monitoring: ESH (2002).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_ESH2002 = 1;

  /// Quality standard for blood pressure monitoring: ESH (2010).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_ESH2010 = 2;

  /// Quality standard for blood pressure monitoring: AAMI.
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_AAMI = 3;

  /// Quality standard for blood pressure monitoring: BHS (A/A).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_BHS_A_A = 4;

  /// Quality standard for blood pressure monitoring: BHS (A/B).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_BHS_A_B = 5;

  /// Quality standard for blood pressure monitoring: BHS (B/A).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_BHS_B_A = 6;

  /// Quality standard for blood pressure monitoring: BHS (B/B).
  static const int HEALTH_DATA_QUALITY_BLOOD_PRESSURE_BHS_B_B = 7;

  /// Quality standard for blood pressure monitoring: ISO 15197:2003.
  static const int HEALTH_DATA_QUALITY_BLOOD_GLUCOSE_ISO151972003 = 8;

  /// Quality standard for blood pressure monitoring: ISO 15197:2013.
  static const int HEALTH_DATA_QUALITY_BLOOD_GLUCOSE_ISO151972013 = 9;

  /// The name of the data collector.
  ///
  /// The input parameter can be null or a string of 1 to 300 characters.
  String? name;

  /// The type of the data collector, such as raw and derived.
  DataGenerateType? dataGenerateType;

  /// The name of the data stream.
  ///
  /// The input parameter can be empty or a string of 1 to 300 characters.
  String? dataStreamName;

  /// The unique identifier of the data collector.
  String? dataStreamId;

  /// The data type.
  DataType? dataType;

  /// The identifier of the device.
  String? deviceId;

  /// The Device information.
  DeviceInfo? deviceInfo;

  /// Whether the data collector is originated from the local device.
  ///
  /// The default value is `false` (non-local device).
  bool? isLocalized;

  /// The package name of the app.
  ///
  /// The input parameter can be an empty string or a string of 1 to 300 characters.
  String? packageName;

  DataCollector({this.name, this.dataStreamName, this.dataStreamId, required this.dataType, required this.dataGenerateType, this.deviceId, this.deviceInfo, this.isLocalized, this.packageName});

  /// Obtains the standard type.
  static String getStandardByType(int type) {
    switch (type) {
      case 1:
        return "blood_pressure_esh2002";
      case 2:
        return "blood_pressure_esh2010";
      case 3:
        return "blood_pressure_aami";
      case 4:
        return "blood_pressure_bhs_a_a";
      case 5:
        return "blood_pressure_bhs_a_b";
      case 6:
        return "blood_pressure_bhs_b_a";
      case 7:
        return "blood_pressure_bhs_b_b";
      case 8:
        return "blood_glucose_iso151972003";
      case 9:
        return "blood_glucose_iso151972013";
      default:
        return "unknown";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "dataGenerateType": dataGenerateType?.index,
      "dataStreamName": dataStreamName,
      "dataStreamId": dataStreamId,
      "dataType": dataType?.toMap(),
      "deviceId": deviceId,
      "deviceInfo": deviceInfo?.toString(),
      "isLocalized": isLocalized,
      "packageName": packageName
    }..removeWhere((k, v) => v == null);
  }

  factory DataCollector.fromMap(Map<String, dynamic> map) {
    return DataCollector(
        name: map['name'] != null ? map['name'] : null,
        packageName: map['packageName'] != null ? map['packageName'] : null,
        dataType: map['dataType'] != null ? DataType.fromMap(Map<String, dynamic>.from(map['dataType'])) : null,
        dataGenerateType: map['dataGenerateType'] != null ? getDataGenerateType(map['dataGenerateType']) : null,
        dataStreamId: map['dataStreamId'] != null ? map['dataStreamId'] : null,
        dataStreamName: map['dataStreamName'] != null ? map['dataStreamName'] : null,
        deviceId: map['deviceId'] != null ? map['deviceId'] : null,
        deviceInfo: map['deviceInfo'] != null ? DeviceInfo.fromMap(Map<String, dynamic>.from(map['deviceInfo'])) : null,
        isLocalized: map['isLocalized'] != null ? map['isLocalized'] : null);
  }

  static DataGenerateType? getDataGenerateType(int value) {
    if (value >= 0 && value <= 5) {
      return DataGenerateType.values[value];
    }
    return null;
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  bool operator ==(Object other) {
    if (!isTypeEqual(this, other)) return false;
    DataCollector compare = other as DataCollector;
    List<dynamic> currentArgs = [name, dataGenerateType, dataStreamName, dataStreamId, dataType, deviceId, deviceInfo, isLocalized, packageName];
    List<dynamic> otherArgs = [
      compare.name,
      compare.dataGenerateType,
      compare.dataStreamName,
      compare.dataStreamId,
      compare.dataType,
      compare.deviceId,
      compare.deviceInfo,
      compare.isLocalized,
      compare.packageName
    ];
    return isEquals(this, other, currentArgs, otherArgs);
  }

  @override
  int get hashCode => hashValues(name, dataGenerateType, dataStreamName, dataType, deviceId, deviceInfo, isLocalized, packageName);
}

enum DataGenerateType {
  /// Raw data type.
  ///
  /// Constant value: 0
  DATA_TYPE_RAW,

  /// Derived data type.
  ///
  /// Constant value: 1
  DATA_TYPE_DERIVED,

  /// Clean data type.
  ///
  /// Constant value: 2
  DATA_TYPE_CLEAN,

  /// Converted data type.
  ///
  /// Constant value: 3
  DATA_TYPE_CONVERTED,

  /// Merged data type.
  ///
  /// Constant value: 4
  DATA_TYPE_MERGED,

  /// Grouped data type.
  ///
  /// Constant value: 5
  DATA_TYPE_POLYMERIZED,
}
