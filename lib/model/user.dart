class User {
  String? name;
  String? email;
  String? password;
  String? gender;
  String? favorite;

  // Constructor
  User({this.name, this.email, this.password, this.gender, this.favorite});

  // Convert a User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'favorite': favorite,
    };
  }

  // Create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      favorite: json['favorite'],
    );
  }
}
