import 'package:with_me/filter/models/filter_model.dart';
import 'package:with_me/home_page/domain/models/home_model.dart';

class FilterLogic {
  final FilterModel? _filterModel = FilterModel.getInstance();

  List<HomeModel> call(List<HomeModel> data) {
    List<HomeModel> filteredData = [];
    if (_filterModel != null) {
      if (_filterModel?.userType == null &&
          _filterModel?.gender == null &&
          _filterModel?.language == null &&
          _filterModel?.country == null &&
          _filterModel?.sliderValue == null) {
        return data;
      } else {
        for (HomeModel item in data) {
          if (_filterModel?.country == item.country) {
            filteredData.add(item);
          } else if (_filterModel?.gender == item.gender) {
            filteredData.add(item);
          } else if (_filterModel?.language == item.language) {
            filteredData.add(item);
          } else if (_filterModel?.userType == item.userType) {
            filteredData.add(item);
          }
        }
      }
    }
    return filteredData;
  }
}
