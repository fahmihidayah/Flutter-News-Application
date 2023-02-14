class Category {
  String? description;
  String? image;
  String? name;

  Category({this.description, this.image, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['description'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
