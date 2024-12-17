class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final UserRole role;
  final String preferredLanguage;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.preferredLanguage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: UserRole.values.firstWhere(
        (role) => role.toString() == json['role'],
      ),
      preferredLanguage: json['preferredLanguage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role.toString(),
      'preferredLanguage': preferredLanguage,
    };
  }
}

enum UserRole {
  farmer,
  aggregator,
  processor,
  institutionalBuyer,
  consumer,
  admin,
}