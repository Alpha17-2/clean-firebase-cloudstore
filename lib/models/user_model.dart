// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? name;
  String email;
  String password;
  String? mobile;
  bool isValidated;
  String id;
  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.mobile,
    required this.id,
    required this.isValidated,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? mobile,
    bool? isValidated,
    String? id,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      isValidated: isValidated ?? this.isValidated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'password': password,
      'mobile': mobile,
      'isValidated': isValidated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      password: map['password'] as String,
      mobile: map['mobile'],
      isValidated: map['isValidated'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, mobile: $mobile, isValidated: $isValidated)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.isValidated == isValidated &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        isValidated.hashCode;
  }
}
