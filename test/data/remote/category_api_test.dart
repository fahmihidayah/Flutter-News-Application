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
import 'article_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late CategoryApi categoryApi;

  setUp(() {
    categoryApi = CategoryApiImpl(dio: mockDio);
  });

  group('getListCategory', () {
    final Map<String, dynamic> mapResponse =
        json.decode(fixture('categories_response.json'));
    final BaseResponse<List<Category>> response = BaseResponse.fromJson(
        mapResponse,
        details: (mapResponse['details'] as List)
            .map((e) => Category.fromJson(e))
            .toList());
    void prepareSuccessfulRequest() {
      when(mockDio.get('v1/categories')).thenAnswer((_) async =>
          await Future.value(Response(
              statusCode: 200,
              data: mapResponse,
              requestOptions: RequestOptions(path: 'v1/categories'))));
    }

    test('request api v1/categories success', () async {
      prepareSuccessfulRequest();
      final expectedResponse = await categoryApi.getListCategories();
      expect(expectedResponse.details?.length, response.details?.length);
    });
  });
}
