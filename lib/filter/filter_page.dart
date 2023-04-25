import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/models/country.dart';
import 'package:with_me/filter/models/gender.dart';
import 'package:with_me/filter/models/languages.dart';
import 'package:with_me/filter/models/user_type.dart';
import 'models/filter_model.dart';
import 'widgets/drop_down_button.dart';
import 'widgets/slider_widget.dart';
import 'widgets/user_type_radio_group_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final FilterModel? _filterModel = FilterModel.getInstance();
  UserType? _userType;
  double? _sliderValue;
  Gender? _gender;
  Languages? _language;
  Country? _country;

  @override
  void initState() {
    _getFilterValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close)),
          ],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded)),
          title: const Text(
            "Filter",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTypeRadioGroupWidget(
                value: _userType,
                onChanged: (value) {
                  _userType = UserType.values[value?.index ?? 0];
                  setState(() {});
                },
              ),
              SliderWidget(
                sliderValue: _sliderValue ?? 0,
                onChanged: (value) {
                  _sliderValue = value;
                  setState(() {});
                },
              ),
              CustomDropdownButton(
                enumList: Gender.values,
                value: _gender,
                onChanged: (value) {
                  _gender = Gender.values[value?.index ?? 0];
                  setState(() {});
                },
                label: "Gender",
              ),
              CustomDropdownButton(
                enumList: Languages.values,
                value: _language,
                onChanged: (value) {
                  _language = Languages.values[value?.index ?? 0];
                  setState(() {});
                },
                label: "Language",
              ),
              CustomDropdownButton(
                enumList: Country.values,
                value: _country,
                onChanged: (value) {
                  _country = Country.values[value?.index ?? 0];
                  setState(() {});
                },
                label: "Country",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: AppColors.backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Expanded(
            child: CustomButton(
              text: "Restore Default",
              onPressed: _restoreFilterDefaultValues,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomButton(
              text: "Apply",
              onPressed: _saveFilterValues,
            ),
          ),
        ]),
      ),
    );
  }

  void _restoreFilterDefaultValues() {
    _filterModel?.emptyAllValues();
    Navigator.of(context).pop(_filterModel);
  }

  void _getFilterValues() {
    if (_filterModel != null) {
      _userType = _filterModel?.userType;
      _language = _filterModel?.language;
      _sliderValue = _filterModel?.sliderValue;
      _gender = _filterModel?.gender;
      _country = _filterModel?.country;
    }
  }

  void _saveFilterValues() {
    _filterModel?.updateValues(
        _userType, _sliderValue, _gender, _language, _country);
    Navigator.of(context).pop(_filterModel);
  }
}
