import 'package:with_me/common/data/models/api_home_model.dart';
import 'package:with_me/home_page/domain/models/home_model.dart';

extension MapApiHomeDataToHomeModel on ApiHomeData {
  HomeModel map() {
    return HomeModel(
        image, name, rate, address, price, age, language, country, gender,userType);
  }
}
