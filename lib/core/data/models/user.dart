class User {
  User({
      this.username, 
      this.email, 
      this.firstName, 
      this.token,});

  User.fromJson(dynamic json) {
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    token = json['token'];
  }
  String? username;
  String? email;
  String? firstName;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['email'] = email;
    map['first_name'] = firstName;
    map['token'] = token;
    return map;
  }

}