import 'dart:async';
import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/rating_bar.dart';
import 'package:with_me/common/data/local_data/home_data.dart';
import 'package:with_me/common/data/mapper/map_api_home_to_home.dart';
import 'package:with_me/common/data/models/api_home_model.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/filter_page.dart';
import 'package:with_me/home_page/domain/models/home_model.dart';
import 'package:with_me/home_page/ui/widgets/sort_dialog.dart';
import 'package:with_me/home_page/utils/filter_logic.dart';
import 'package:with_me/home_page/utils/sort.dart';
import 'package:with_me/notification_page/notification_page.dart';
import 'widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SortLogic _sortLogicObj = SortLogic();
  final FilterLogic _filterLogic = FilterLogic();

  SortEnum sortValue = SortEnum.highestReview;
  String? _searchText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hello My Friend'),
              SizedBox(
                height: 8,
              ),
              Text('Explore The Best Places In The World.',
                  style: TextStyle(fontSize: 14, color: Colors.white54)),
            ]),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ));
              },
              icon: const Icon(Icons.notifications_rounded))
        ],
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(child: SearchWidget(
              onChanged: (value) {
                _searchText = value;
                _onSearchTextChane(value);
              },
            )),
            IconButton(
                constraints: const BoxConstraints(maxWidth: 25),
                padding: EdgeInsets.zero,
                onPressed: () {
                  SortDialog.sortDialog(context, initialValue: sortValue)
                      .then((value) {
                    if (value != null) {
                      sortValue = value;
                      _getHomeData();
                      setState(() {});
                    }
                  });
                },
                icon: const Icon(
                  Icons.sort,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: _navigateToFilter,
                icon: const Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                )),
          ]),
          Expanded(
            child: FutureBuilder(
              future: _getHomeData(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final HomeModel? item = snapshot.data?[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.forthColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(item?.image ??
                                          "https://thumbs.dreamstime.com/b/surprised-female-person-confused-isolated-surprised-female-person-confused-isolated-168304856.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(item?.name ?? "Sama"),
                                RatingBar(rate: item?.rate ?? 0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 17,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(item?.address ?? 'Egypt/cairo'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("${item?.price} \$"),
                              ],
                            ))
                          ]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Timer? _searchTimer;
  void _onSearchTextChane(String text) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 350), () async {
      await _getHomeData();
      setState(() {});
    });
  }

  List<HomeModel> _getSearchResult(String? text, List<HomeModel> data) {
    final List<HomeModel> searchData = [];
    for (HomeModel item in data) {
      if (item.name.toLowerCase().contains(text?.toLowerCase() ?? '')) {
        searchData.add(item);
      }
    }
    return searchData;
  }

  Future<List<HomeModel>> _getHomeData() async {
    final apiModel = ApiHomeModel.fromJson(apiHomeLocalData);
    List<HomeModel> homeData = apiModel.data.map((e) => e.map()).toList();
    if (_searchText != null && _searchText != "") {
      homeData = _getSearchResult(_searchText, [...homeData]);
    }
    homeData = _filterLogic(homeData);
    return _sortLogicObj.sortData(homeData, sortValue);
  }

  Future<void> _navigateToFilter() async {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => const FilterPage(),
    ))
        .then((value) {
      if (value != null) {
        _getHomeData();
        setState(() {});
      }
    });
  }
}
