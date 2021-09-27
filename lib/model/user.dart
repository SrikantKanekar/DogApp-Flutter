class User {
  String email;
  String username;
  String password;

  User({
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, Object?> toMap() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }

  static User fromMap(Map<String, Object?> map) {
    return User(
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
