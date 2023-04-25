import 'package:equatable/equatable.dart';
import 'package:with_me/filter/models/country.dart';
import 'package:with_me/filter/models/gender.dart';
import 'package:with_me/filter/models/languages.dart';
import 'package:with_me/filter/models/user_type.dart';

class HomeModel extends Equatable {
  final String image;
  final String name;
  final int rate;
  final String address;
  final double price;
  final int age;
  final Languages language;
  final Country country;
  final Gender gender;
  final UserType userType;

  const HomeModel(this.image, this.name, this.rate, this.address, this.price,
      this.age, this.language, this.country, this.gender, this.userType);

  @override
  List<Object?> get props => [
        image,
        name,
        rate,
        address,
        price,
        userType,
        country,
        language,
        age,
        gender
      ];
}
