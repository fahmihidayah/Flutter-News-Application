class Configuration {


  Configuration({
      this.key, 
      this.value, 
      this.createdAt, 
      this.updatedAt,});

  Configuration.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}