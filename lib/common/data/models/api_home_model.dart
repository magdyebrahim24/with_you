// To parse this JSON data, do
//
//     final apiHomeModel = apiHomeModelFromJson(jsonString);

import 'dart:convert';

import 'package:with_me/filter/models/country.dart';
import 'package:with_me/filter/models/gender.dart';
import 'package:with_me/filter/models/languages.dart';
import 'package:with_me/filter/models/user_type.dart';

ApiHomeModel apiHomeModelFromJson(String str) =>
    ApiHomeModel.fromJson(json.decode(str));

String apiHomeModelToJson(ApiHomeModel data) => json.encode(data.toJson());

class ApiHomeModel {
  ApiHomeModel({
    required this.data,
  });

  List<ApiHomeData> data;

  factory ApiHomeModel.fromJson(Map<String, dynamic> json) => ApiHomeModel(
        data: List<ApiHomeData>.from(
            json["data"].map((x) => ApiHomeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ApiHomeData {
  ApiHomeData({
    required this.image,
    required this.name,
    required this.rate,
    required this.address,
    required this.price,
    required this.age,
    required this.gender,
    required this.language,
    required this.country,
    required this.userType,
  });

  String image;
  String name;
  int rate;
  String address;
  double price;
  int age;
  Languages language;
  Country country;
  Gender gender;
  UserType userType;

  factory ApiHomeData.fromJson(Map<String, dynamic> json) => ApiHomeData(
        image: json["image"],
        name: json["name"],
        rate: json["rate"],
        address: json["address"],
        price: json["price"]?.toDouble(),
        age: json["age"]?.toInt(),
        language: json["language"],
        country: json["country"],
        gender: json["gender"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "rate": rate,
        "address": address,
        "price": price,
        "age": age,
        "language": language,
        "country": country,
        "gender": gender,
        "userType": userType,
      };
}
