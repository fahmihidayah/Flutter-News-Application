import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/configurations_fixtures.dart';

void main() {
  test("test deserializer fixture file to base response list configuration result success", () async {

    final BaseResponse<List<Configuration>> response = getBaseResponseListConfiguration();
    expect(response.details?.isNotEmpty, true);
  });

}
