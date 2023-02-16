import 'package:news_app/data/models/author.dart';

class Article {
    Author? author;
    String? content;
    String? created_at;
    int? favorite;
    String? image;
    bool? is_featured;
    bool? is_publish;
    String? title;
    String? updated_at;

    Article({this.author, this.content, this.created_at, this.favorite, this.image, this.is_featured, this.is_publish, this.title, this.updated_at});

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            author: json['author'] != null ? Author.fromJson(json['author']) : null,
            content: json['content'], 
            created_at: json['created_at'], 
            favorite: json['favorite'], 
            image: json['image'], 
            is_featured: json['is_featured'], 
            is_publish: json['is_publish'], 
            title: json['title'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['content'] = this.content;
        data['created_at'] = this.created_at;
        data['favorite'] = this.favorite;
        data['image'] = this.image;
        data['is_featured'] = this.is_featured;
        data['is_publish'] = this.is_publish;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        if (this.author != null) {
            data['author'] = this.author?.toJson();
        }
        return data;
    }
}