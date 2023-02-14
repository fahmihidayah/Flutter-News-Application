class Author {
    String? email;
    String? firstName;
    String? username;

    Author({this.email, this.firstName, this.username});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
            email: json['email'], 
            firstName: json['first_name'],
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['first_name'] = this.firstName;
        data['username'] = this.username;
        return data;
    }
}