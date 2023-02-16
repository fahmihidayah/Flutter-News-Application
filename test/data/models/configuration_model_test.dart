import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  test("test deserializer configuration model", () async {
    final Map<String, dynamic> mapJson =
        json.decode(fixture("configurations_response.json"));
    final BaseResponse<List<Configuration>> response = BaseResponse.fromJson(
        mapJson,
        details: (mapJson['details'] as List)
            .map((e) => Configuration.fromJson(e))
            .toList());
    expect(response.details?.length, 5);
  });

}
