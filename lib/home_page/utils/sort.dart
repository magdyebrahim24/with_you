import 'package:with_me/home_page/domain/models/home_model.dart';
import 'package:with_me/home_page/ui/widgets/sort_dialog.dart';

class SortLogic {
  List<HomeModel> sortData(List<HomeModel> unSortData, SortEnum sortValue) {
    List<HomeModel> sortedData = [];

    switch (sortValue) {
      case SortEnum.highestReview:
        sortedData = _highestReviewSort(unSortData);
        break;
      case SortEnum.lowestReview:
        sortedData = _lowestReviewSort(unSortData);
        break;
      case SortEnum.highestPrice:
        sortedData = _highestPriceSort(unSortData);
        break;
      case SortEnum.lowestPrice:
        sortedData = _lowestPriceSort(unSortData);
        break;
    }
    return sortedData;
  }

  List<HomeModel> _highestReviewSort(List<HomeModel> unSortData) {
    List<HomeModel> sortedData = unSortData;
    sortedData.sort((b, a) => a.rate.compareTo(b.rate));
    return sortedData;
  }

  List<HomeModel> _lowestReviewSort(List<HomeModel> unSortData) {
    List<HomeModel> sortedData = unSortData;
    sortedData.sort((a, b) => a.rate.compareTo(b.rate));
    return sortedData;
  }

  List<HomeModel> _highestPriceSort(List<HomeModel> unSortData) {
    List<HomeModel> sortedData = unSortData;
    sortedData.sort((b, a) => a.price.compareTo(b.price));
    return sortedData;
  }

  List<HomeModel> _lowestPriceSort(List<HomeModel> unSortData) {
    List<HomeModel> sortedData = unSortData;
    sortedData.sort((a, b) => a.price.compareTo(b.price));
    return sortedData;
  }
}
