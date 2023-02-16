import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/user.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  test('test deserializer user model', () async {
    final Map<String, dynamic> responseJsonMap =
    json.decode(fixture("auth_response.json"));
    final BaseResponse<User> response = BaseResponse.fromJson(
        responseJsonMap,
        details: User.fromJson(responseJsonMap['details']));
    expect(response.details?.username, "fahmi");
  });
}