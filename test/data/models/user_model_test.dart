import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/user.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/auth_fixtures.dart';

void main() {
  test('test deserializer fixture file to base response user result success', () async {
    final BaseResponse<User> response = getBaseResponseUser();
    expect(response.details?.username, "fahmi");
  });
}