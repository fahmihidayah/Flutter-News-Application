import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/category/category_api.dart';
import 'package:news_app/data/remote/category/category_api_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/categories_fixtures.dart';
import 'article_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late CategoryApi categoryApi;

  setUp(() {
    categoryApi = CategoryApiImpl(dio: mockDio);
  });

  group('getListCategory', () {
    final Map<String, dynamic> mapResponse = getListCategoryMap();
    final BaseResponse<List<Category>> response = getBaseResponseListCategory();

    void prepareSuccessfulRequest() {
      when(mockDio.get('v1/categories')).thenAnswer((_) async =>
          await Future.value(Response(
              statusCode: 200,
              data: mapResponse,
              requestOptions: RequestOptions(path: 'v1/categories'))));
    }

    test('test request to v1/categories result success', () async {
      prepareSuccessfulRequest();
      final expectedResponse = await categoryApi.getListCategories();
      expect(expectedResponse.details?.length, response.details?.length);
    });
  });
}
