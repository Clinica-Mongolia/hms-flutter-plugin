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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../huawei_health.dart';

/// Provides [signIn] method for obtaining the Health Kit Authorization from the user.
class HealthAuth {
  static final MethodChannel _channel = health_account_method_channel;

  /// Obtains the Health Kit permissions from the user by the defined List of [Scope]s.
  static Future<AuthHuaweiId> signIn(List<Scope> scopes) async {
    List<String> scopeStrList = <String>[];
    scopes.forEach((e) {
      scopeStrList.add(e.scopeStr);
    });
    String jsonResult = await _channel.invokeMethod("signIn", {"scopes": scopeStrList});
    return AuthHuaweiId.fromMap(jsonDecode(jsonResult));
  }
}
