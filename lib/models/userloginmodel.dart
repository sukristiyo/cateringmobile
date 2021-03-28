// To parse this JSON data, do
//
//     final userloginmodel = userloginmodelFromJson(jsonString);

part of '../ui/pages/pages.dart';

// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.roles});

  String id;
  String name;
  String email;
  String password;
  String address;
  String houseNumber;
  String phoneNumber;
  String city;
  String roles;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      address: json["address"],
      houseNumber: json["houseNumber"],
      phoneNumber: json["phoneNumber"],
      city: json["city"],
      roles: json["roles"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "roles": roles
      };
}
