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
import '../../fixtures/model/categories_fixtures.dart';
import 'category_repository_test.mocks.dart';

@GenerateMocks([CategoryApi])
void main() {
  MockCategoryApi mockCategoryApi = MockCategoryApi();
  late CategoryRepository categoryRepository;

  setUp(() {
    categoryRepository = CategoryRepositoryImpl(mockCategoryApi);
  });

  group('getListCategory', () {

    final BaseResponse<List<Category>> response = getBaseResponseListCategory();
    void prepareSuccessfulResponse() {
      when(mockCategoryApi.getListCategories()).thenAnswer((realInvocation) => Future.value(response));
    }
    
    test('test getListCategory return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await categoryRepository.getListCategory();
      expect(actualResponse.isRight(), true);
    });
  });
}
