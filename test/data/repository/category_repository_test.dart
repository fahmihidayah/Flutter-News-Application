import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/category/category_api.dart';
import 'package:news_app/data/repository/category/category_repository.dart';
import 'package:news_app/data/repository/category/category_repository_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'category_repository_test.mocks.dart';

@GenerateMocks([CategoryApi])
void main() {
  MockCategoryApi mockCategoryApi = MockCategoryApi();
  late CategoryRepository categoryRepository;

  setUp(() {
    categoryRepository = CategoryRepositoryImpl(mockCategoryApi);
  });

  group('getListCategory', () {
    final Map<String, dynamic> mapResponse =
        json.decode(fixture('categories_response.json'));
    final BaseResponse<List<Category>> response = BaseResponse.fromJson(
        mapResponse,
        details: (mapResponse['details'] as List)
            .map((e) => Category.fromJson(e))
            .toList());
    void prepareSuccessfulResponse() {
      when(mockCategoryApi.getListCategories()).thenAnswer((realInvocation) => Future.value(response));
    }
    
    test('request list categories return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await categoryRepository.getListCategory();
      expect(actualResponse.isRight(), true);
    });
  });
}
