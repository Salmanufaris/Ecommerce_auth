class UserAuthentication {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;

  UserAuthentication(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.userId});

  factory UserAuthentication.fromJson(Map<String, dynamic> json) {
    return UserAuthentication(
      name: json['name'],
      email: json['email'],
      userId: json["userId"],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userId': userId,
    };
  }
}
