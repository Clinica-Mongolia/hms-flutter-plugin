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

import '../../../huawei_health.dart';

/// Data types defined by HUAWEI Health Kit.
///
/// Each data type has a unique name for the identification purpose.
/// Each data type has its own meaning. For example, DT_CONTINUOUS_STEPS_DELTA
/// indicates the number of steps taken since the last reading.
///
/// You can also create you own data types with the [addDataType] API from the
/// [SettingController] module.
class DataType {
  /// Default data type.
  static const DataType DT_UNUSED_DATA_TYPE = DataType(
      'com.huawei.unused.datatype',
      "",
      "",
      [Field.newStringField("emptyField")]);

  /// Steps taken since the last reading.
  ///
  /// The value range over 1 second is `(0, 10]`, that over 1 minute is `(0, 600]`,
  /// and that over 1 hour is `(0, 36000]`.
  static const DataType DT_CONTINUOUS_STEPS_DELTA = DataType(
      "com.huawei.continuous.steps.delta",
      "https://www.huawei.com/healthkit/step.read",
      "https://www.huawei.com/healthkit/step.write",
      [Field.FIELD_STEPS_DELTA]);

  /// Total number of steps.
  ///
  /// This data type applies only to data query scenarios.
  static const DataType DT_CONTINUOUS_STEPS_TOTAL = DataType(
      "com.huawei.continuous.steps.total",
      "https://www.huawei.com/healthkit/step.read",
      "https://www.huawei.com/healthkit/step.write",
      [Field.FIELD_STEPS]);

  /// Number of steps per minute.
  static const DataType DT_INSTANTANEOUS_STEPS_RATE = DataType(
      "com.huawei.instantaneous.steps.rate",
      "https://www.huawei.com/healthkit/step.read",
      "https://www.huawei.com/healthkit/step.write",
      [Field.FIELD_STEP_RATE]);

  /// Step cadence statistics.
  static const DataType DT_CONTINUOUS_STEPS_RATE_STATISTIC = DataType(
      "com.huawei.continuous.steps.rate.statistics",
      "https://www.huawei.com/healthkit/step.read",
      "https://www.huawei.com/healthkit/step.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN]);

  /// Calories consumed within a period of time (unit: kcal).
  static const DataType DT_CONTINUOUS_CALORIES_CONSUMED = DataType(
      "com.huawei.continuous.calories.consumed",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES]);

  /// This field is mandatory.
  ///
  /// The value range over 1 second is `(0, 0.555555555555556]`, that over
  /// 1 minute is `(0, 33.333333333333333]`, and that over 1 hour is `(0, 2000]`.
  static const DataType DT_CONTINUOUS_CALORIES_BURNT = DataType(
      "com.huawei.continuous.calories.burnt",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES]);

  /// Basic metabolic rate per day (unit: kcal).
  static const DataType DT_INSTANTANEOUS_CALORIES_BMR = DataType(
      "com.huawei.instantaneous.calories.bmr",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES]);

  /// Instantaneous sampling of power.
  static const DataType DT_INSTANTANEOUS_POWER_SAMPLE = DataType(
      "com.huawei.instantaneous.power.sample",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_POWER]);

  /// A single activity type within a period of time.
  static const DataType DT_INSTANTANEOUS_ACTIVITY_SAMPLE = DataType(
      "com.huawei.instantaneous.activity.sample",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_POSSIBILITY]);

  /// Activity type within a period of time.
  static const DataType DT_INSTANTANEOUS_ACTIVITY_SAMPLES = DataType(
      "com.huawei.instantaneous.activity.samples",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_POSSIBILITY_OF_ACTIVITY]);

  /// Heart rate (unit: heartbeats per minute).
  ///
  /// This field is mandatory. The value range is `(0, 255)`.
  static const DataType DT_INSTANTANEOUS_HEART_RATE = DataType(
      "com.huawei.instantaneous.heart_rate",
      "https://www.huawei.com/healthkit/heartrate.read",
      "https://www.huawei.com/healthkit/heartrate.write",
      [Field.FIELD_BPM]);

  /// Location at a given time.
  static const DataType DT_INSTANTANEOUS_LOCATION_SAMPLE = DataType(
      "com.huawei.instantaneous.location.sample",
      "https://www.huawei.com/healthkit/location.read",
      "https://www.huawei.com/healthkit/location.write", [
    Field.FIELD_LATITUDE,
    Field.FIELD_LONGITUDE,
    Field.FIELD_PRECISION,
    Field.FIELD_ALTITUDE
  ]);

  /// A point on the trajectory.
  static const DataType DT_INSTANTANEOUS_LOCATION_TRACE = DataType(
      "com.huawei.instantaneous.location.trace",
      "https://www.huawei.com/healthkit/location.read",
      "https://www.huawei.com/healthkit/location.write", [
    Field.FIELD_LATITUDE,
    Field.FIELD_LONGITUDE,
    Field.FIELD_PRECISION,
    Field.FIELD_ALTITUDE
  ]);

  /// Distance covered since the last reading (unit: meter).
  ///
  /// This field is mandatory. The value range over 1 second is `(0, 100]`, that
  /// over 1 minute is `(0, 6000]`, and that over 1 hour is `(0, 360000]`.
  static const DataType DT_CONTINUOUS_DISTANCE_DELTA = DataType(
      "com.huawei.continuous.distance.delta",
      "https://www.huawei.com/healthkit/distance.read",
      "https://www.huawei.com/healthkit/distance.write",
      [Field.FIELD_DISTANCE_DELTA]);

  /// Accumulated distance covered (unit: meter).
  static const DataType DT_CONTINUOUS_DISTANCE_TOTAL = DataType(
      "com.huawei.continuous.distance.total",
      "https://www.huawei.com/healthkit/distance.read",
      "https://www.huawei.com/healthkit/distance.write",
      [Field.FIELD_DISTANCE]);

  /// Total calories.
  static const DataType DT_CONTINUOUS_CALORIES_BURNT_TOTAL = DataType(
      "com.huawei.continuous.calories.burnt.total",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES_TOTAL]);

  /// Instantaneous speed to the ground (unit: m/s).
  static const DataType DT_INSTANTANEOUS_SPEED = DataType(
      "com.huawei.instantaneous.speed",
      "https://www.huawei.com/healthkit/speed.read",
      "https://www.huawei.com/healthkit/speed.write",
      [Field.FIELD_SPEED]);

  /// Number of rotations of the bicycle wheel within a period of time.
  static const DataType DT_CONTINUOUS_BIKING_WHEEL_ROTATION_TOTAL = DataType(
      "com.huawei.continuous.biking.wheel_rotation.total",
      "https://www.huawei.com/healthkit/speed.read",
      "https://www.huawei.com/healthkit/speed.write",
      [Field.FIELD_ROTATION]);

  /// Instantaneous measurement of the rotational speed of the bicycle wheel per minute.
  static const DataType DT_INSTANTANEOUS_BIKING_WHEEL_ROTATION = DataType(
      "com.huawei.instantaneous.biking.wheel_rotation",
      "https://www.huawei.com/healthkit/speed.read",
      "https://www.huawei.com/healthkit/speed.write",
      [Field.FIELD_RPM]);

  /// Total mileage of the bicycle since the start of the count (unit: meter).
  static const DataType DT_CONTINUOUS_BIKING_PEDALING_TOTAL = DataType(
      "com.huawei.continuous.biking.pedaling.total",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_ROTATION]);

  /// Cycling speed at a time point (unit: m/s).
  static const DataType DT_INSTANTANEOUS_BIKING_PEDALING_RATE = DataType(
      "com.huawei.instantaneous.biking.pedaling.rate",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_RPM]);

  /// Height (unit: meter). This field is mandatory. The value range is (0.4, 2.6).
  static const DataType DT_INSTANTANEOUS_HEIGHT = DataType(
      "com.huawei.instantaneous.height",
      "https://www.huawei.com/healthkit/heightweight.read",
      "https://www.huawei.com/healthkit/heightweight.write",
      [Field.FIELD_HEIGHT]);

  /// Weight (unit: kg). This field is mandatory. The value range is (1, 560).
  static const DataType DT_INSTANTANEOUS_BODY_WEIGHT = DataType(
      "com.huawei.instantaneous.body_weight",
      "https://www.huawei.com/healthkit/heightweight.read",
      "https://www.huawei.com/healthkit/heightweight.write", [
    Field.FIELD_BODY_WEIGHT,
    Field.FIELD_BMI,
    Field.FIELD_BODY_FAT,
    Field.FIELD_BODY_FAT_RATE,
    Field.FIELD_MUSCLE_MASS,
    Field.FIELD_BASAL_METABOLISM,
    Field.FIELD_MOISTURE,
    Field.FIELD_MOISTURE_RATE,
    Field.FIELD_VISCERAL_FAT_LEVEL,
    Field.FIELD_BONE_SALT,
    Field.FIELD_PROTEIN_RATE,
    Field.FIELD_BODY_AGE,
    Field.FIELD_BODY_SCORE,
    Field.FIELD_SKELETAL_MUSCLE_MASS,
    Field.FIELD_IMPEDANCE
  ]);

  /// Body fat rate.
  static const DataType DT_INSTANTANEOUS_BODY_FAT_RATE = DataType(
      "com.huawei.instantaneous.body.fat.rate",
      "https://www.huawei.com/healthkit/bodyfat.read",
      "https://www.huawei.com/healthkit/bodyfat.write",
      [Field.FIELD_BODY_FAT_RATE]);

  /// Nutrient intake over a meal.
  static const DataType DT_INSTANTANEOUS_NUTRITION_FACTS = DataType(
      "com.huawei.instantaneous.nutrition_facts",
      "https://www.huawei.com/healthkit/nutrition.read",
      "https://www.huawei.com/healthkit/nutrition.write",
      [Field.FIELD_NUTRIENTS_FACTS, Field.FIELD_MEAL, Field.FIELD_FOOD]);

  /// Water taken over a single drink (unit: liter).
  static const DataType DT_INSTANTANEOUS_HYDRATE = DataType(
      "com.huawei.instantaneous.hydrate",
      "https://www.huawei.com/healthkit/nutrition.read",
      "https://www.huawei.com/healthkit/nutrition.write",
      [Field.FIELD_HYDRATE]);

  /// Workout duration (unit: minute).
  static const DataType DT_CONTINUOUS_WORKOUT_DURATION = DataType(
      "com.huawei.continuous.workout.duration",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_SPAN]);

  /// Workout intensity.
  static const DataType DT_CONTINUOUS_EXERCISE_INTENSITY = DataType(
      "com.huawei.continuous.exercise_intensity",
      "https://www.huawei.com/healthkit/strength.read",
      "https://www.huawei.com/healthkit/strength.write",
      [Field.FIELD_INTENSITY]);

  /// Sleep statistics.
  static const DataType DT_STATISTICS_SLEEP = DataType(
      "com.huawei.continuous.sleep.fragment",
      "https://www.huawei.com/healthkit/sleep.read",
      "https://www.huawei.com/healthkit/sleep.write",
      [Field.SLEEP_STATE]);

  /// Sleep details. For information about the input values of this data type, see SleepFragmentCategory.
  static const DataType DT_CONTINUOUS_SLEEP = DataType(
      "com.huawei.continuous.sleep.fragment",
      "https://www.huawei.com/healthkit/sleep.read",
      "https://www.huawei.com/healthkit/sleep.write",
      [Field.SLEEP_STATE]);

  /// Pressure details.
  static const DataType DT_INSTANTANEOUS_STRESS = DataType(
      "com.huawei.instantaneous.stress",
      "https://www.huawei.com/healthkit/stress.read",
      "https://www.huawei.com/healthkit/stress.write",
      [Field.SCORE, Field.GRADE, Field.MEASURE_TYPE]);

  /// Pressure statistics.
  static const DataType DT_INSTANTANEOUS_STRESS_STATISTICS = DataType(
      "com.huawei.instantaneous.stress.statistics",
      "https://www.huawei.com/healthkit/stress.read",
      "https://www.huawei.com/healthkit/stress.write", [
    Field.STRESS_AVG,
    Field.STRESS_MAX,
    Field.STRESS_MIN,
    Field.STRESS_LAST,
    Field.MEASURE_COUNT
  ]);

  /// Workout duration over a period of time (unit: minute).
  static const DataType POLYMERIZE_CONTINUOUS_WORKOUT_DURATION = DataType(
      "com.huawei.continuous.workout.duration",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_SPAN],
      isPolymerizedFlag: true);

  /// Summarized statistics of a specific activity type within a period of time.
  static const DataType POLYMERIZE_CONTINUOUS_ACTIVITY_STATISTICS = DataType(
      "com.huawei.continuous.activity.statistics",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_TYPE_OF_ACTIVITY, Field.FIELD_SPAN, Field.FIELD_FRAGMENTS],
      isPolymerizedFlag: true);

  /// Average, maximum, and minimum basic metabolic rates over a period of time (unit: kcal).
  static const DataType POLYMERIZE_CONTINUOUS_CALORIES_BMR_STATISTICS =
      DataType(
          "com.huawei.continuous.calories.bmr.statistics",
          "https://www.huawei.com/healthkit/calories.read",
          "https://www.huawei.com/healthkit/calories.write",
          [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
          isPolymerizedFlag: true);

  /// Step increment within a period of time.
  static const DataType POLYMERIZE_STEP_COUNT_DELTA = DataType(
      "com.huawei.continuous.steps.delta",
      "https://www.huawei.com/healthkit/step.read",
      "https://www.huawei.com/healthkit/step.write",
      [Field.FIELD_STEPS_DELTA],
      isPolymerizedFlag: true);

  /// Distance increment within a period of time.
  static const DataType POLYMERIZE_DISTANCE_DELTA = DataType(
      "com.huawei.continuous.distance.delta",
      "https://www.huawei.com/healthkit/distance.read",
      "https://www.huawei.com/healthkit/distance.write",
      [Field.FIELD_DISTANCE_DELTA],
      isPolymerizedFlag: true);

  /// Total calories consumed.
  static const DataType POLYMERIZE_CALORIES_CONSUMED = DataType(
      "com.huawei.continuous.calories.consumed",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES],
      isPolymerizedFlag: true);

  /// Total calories consumed within a period of time (unit: kcal).
  static const DataType POLYMERIZE_CALORIES_EXPENDED = DataType(
      "com.huawei.continuous.calories.burnt",
      "https://www.huawei.com/healthkit/calories.read",
      "https://www.huawei.com/healthkit/calories.write",
      [Field.FIELD_CALORIES],
      isPolymerizedFlag: true);

  /// Heartbeat intensity statistics.
  static const DataType POLYMERIZE_CONTINUOUS_EXERCISE_INTENSITY_STATISTICS =
      DataType(
          "com.huawei.continuous.exercise_intensity.statistics",
          "https://www.huawei.com/healthkit/strength.read",
          "https://www.huawei.com/healthkit/strength.write",
          [Field.FIELD_INTENSITY, Field.FIELD_SPAN],
          isPolymerizedFlag: true);

  /// Average, maximum, and minimum heartbeats per minute within a period of time.
  static const DataType POLYMERIZE_CONTINUOUS_HEART_RATE_STATISTICS = DataType(
      "com.huawei.continuous.heart_rate.statistics",
      "https://www.huawei.com/healthkit/heartrate.read",
      "https://www.huawei.com/healthkit/heartrate.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
      isPolymerizedFlag: true);

  /// Activity boundaries within a period of time.
  static const DataType POLYMERIZE_CONTINUOUS_LOCATION_BOUNDARY_RANGE =
      DataType(
          "com.huawei.continuous.location.boundary_range",
          "https://www.huawei.com/healthkit/location.read",
          "https://www.huawei.com/healthkit/location.write",
          [
            Field.FIELD_MIN_LATITUDE,
            Field.FIELD_MIN_LONGITUDE,
            Field.FIELD_MAX_LATITUDE,
            Field.FIELD_MAX_LONGITUDE
          ],
          isPolymerizedFlag: true);

  /// Power within a period of time (including the maximum, minimum, and average power in the unit of watt).
  static const DataType POLYMERIZE_CONTINUOUS_POWER_STATISTICS = DataType(
      "com.huawei.continuous.power.statistics",
      "https://www.huawei.com/healthkit/activity.read",
      "https://www.huawei.com/healthkit/activity.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
      isPolymerizedFlag: true);

  /// Ground speed (including the maximum, minimum, and average speed in the unit of m/s).
  static const DataType POLYMERIZE_CONTINUOUS_SPEED_STATISTICS = DataType(
      "com.huawei.continuous.speed.statistics",
      "https://www.huawei.com/healthkit/speed.read",
      "https://www.huawei.com/healthkit/speed.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
      isPolymerizedFlag: true);

  /// Body fat rate over a period of time (including the maximum, minimum, and average values).
  static const DataType POLYMERIZE_CONTINUOUS_BODY_FAT_RATE_STATISTICS =
      DataType(
          "com.huawei.continuous.body.fat.rate.statistics",
          "https://www.huawei.com/healthkit/bodyfat.read",
          "https://www.huawei.com/healthkit/bodyfat.write",
          [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
          isPolymerizedFlag: true);

  /// Weight over a period of time (including maximum, minimum, and average values in the unit of kg).
  static const DataType POLYMERIZE_CONTINUOUS_BODY_WEIGHT_STATISTICS = DataType(
      "com.huawei.continuous.body_weight.statistics",
      "https://www.huawei.com/healthkit/heightweight.read",
      "https://www.huawei.com/healthkit/heightweight.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
      isPolymerizedFlag: true);

  /// Height over a period of time (including maximum, minimum, and average values in the unit of meter).
  static const DataType POLYMERIZE_CONTINUOUS_HEIGHT_STATISTICS = DataType(
      "com.huawei.continuous.height.statistics",
      "https://www.huawei.com/healthkit/heightweight.read",
      "https://www.huawei.com/healthkit/heightweight.write",
      [Field.FIELD_AVG, Field.FIELD_MAX, Field.FIELD_MIN],
      isPolymerizedFlag: true);

  /// Sum of nutrient intake over a period of time.
  static const DataType POLYMERIZE_CONTINUOUS_NUTRITION_FACTS_STATISTICS =
      DataType(
          "com.huawei.continuous.nutrition_facts.statistics",
          "https://www.huawei.com/healthkit/nutrition.read",
          "https://www.huawei.com/healthkit/nutrition.write",
          [Field.FIELD_NUTRIENTS, Field.FIELD_MEAL],
          isPolymerizedFlag: true);

  /// Water intake over a period of time (unit: liter).
  static const DataType POLYMERIZE_HYDRATION = DataType(
      "com.huawei.instantaneous.hydrate",
      "https://www.huawei.com/healthkit/nutrition.read",
      "https://www.huawei.com/healthkit/nutrition.write",
      [Field.FIELD_HYDRATE],
      isPolymerizedFlag: true);

  /// Name. The value must be a string of 1 to 300 characters.
  final String? name;

  /// App package name.
  final String? packageName;

  /// Read permission of the data type.
  ///
  /// The value can be an empty string or a string of 1 to 1000 characters.
  final String? scopeNameRead;

  /// Write permission of the data type.
  ///
  /// The value can be an empty string or a string of 1 to 1000 characters.
  final String? scopeNameWrite;

  /// Attribute list.
  final List<Field>? fields;

  /// Indicates whether it is a grouped data type.
  final bool? isPolymerizedFlag;

  /// Whether the data type is a customized one.
  final bool? isSelfDefined;

  const DataType(
      this.name, this.scopeNameRead, this.scopeNameWrite, this.fields,
      {this.isPolymerizedFlag = false,
      this.isSelfDefined = false,
      this.packageName = ""});

  factory DataType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return DataType(
      map['name'] != null ? map['name'] : "",
      map['scopeNameRead'] != null ? map['scopeNameRead'] : null,
      map['scopeNameWrite'] != null ? map['scopeNameWrite'] : null,
      map['fields'] != null
          ? List.from(map['fields']
              .map((e) => Field.fromMap(Map<String, dynamic>.from(e))))
          : null,
      isPolymerizedFlag:
          map['isPolymerizedFlag'] != null ? map['isPolymerizedFlag'] : null,
      isSelfDefined: map['isSelfDefined'] != null ? map['isSelfDefined'] : null,
      packageName: map['packageName'] != null ? map['packageName'] : null,
    );
  }

  static String getMimeType(DataType dataType) {
    String mime = "vnd.huawei.hihealth.data_type/";
    if (dataType.name != null && dataType.name!.isNotEmpty) {
      return mime + dataType.name!;
    }
    return mime;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "fieldList": fields?.toString(),
      "isPolymerizedFlag": isPolymerizedFlag,
      "isSelfDefined": isSelfDefined,
      "scopeNameRead": scopeNameRead,
      "scopeNameWrite": scopeNameWrite
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
