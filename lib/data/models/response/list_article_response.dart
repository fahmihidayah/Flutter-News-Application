import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';

class ListArticlesResponse extends BaseResponse<List<Article>> {
  ListArticlesResponse(
      {required super.code,
      required super.details,
      required super.error,
      required super.message});


  factory ListArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ListArticlesResponse(
      code: json['code'],
      details: ( json['details'] as List).map((e) => Article.fromJson(e)).toList(),
      error: json['error'],
      message: json['message'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['error'] = error;
    data['message'] = message;
    if (details != null) {
      data['details'] = details?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
