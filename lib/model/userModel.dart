import 'package:flutter_application_3/signup.dart';

// ignore: camel_case_types
class userModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? uid;

  userModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

//receiving data from server

  factory userModel.fromMap(map) {
    return userModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        phone: map['phone'],
        password: map['password']);
  }

//sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
