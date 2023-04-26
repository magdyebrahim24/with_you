import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/custom_widgets/multi_select_drop_down_menu.dart';
import 'package:with_me/common/custom_widgets/text_form_field.dart';
import 'package:with_me/common/domain/use_cases/set_login_usecase.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/models/country.dart';
import 'package:with_me/filter/models/languages.dart';
import 'package:with_me/filter/models/user_type.dart';
import 'package:with_me/filter/widgets/drop_down_button.dart';
import 'package:with_me/host_page.dart';

class CompleteRegisterPage extends StatefulWidget {
  final UserType userType;
  const CompleteRegisterPage({Key? key, required this.userType})
      : super(key: key);

  @override
  State<CompleteRegisterPage> createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  final SetLogInUseCase _setLogInUseCase = SetLogInUseCase();
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _age;
  String? _experience;
  String? _phoneNumber;
  Country? _country;
  Country? _countryOfResidence;
  List<String> _languages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Complete Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "First Name",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  AppTextFormFiled(
                    hintText: "Enter First Name",
                    labelText: "Enter First Name",
                    onChanged: (text) {
                      _firstName = text;
                      setState(() {});
                    },
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  AppTextFormFiled(
                    hintText: "Last name",
                    labelText: "Last Name",
                    onChanged: (email) {
                      _lastName = email;
                      setState(() {});
                    },
                  ),
                  const Text(
                    "Age",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  AppTextFormFiled(
                    hintText: "Age",
                    labelText: "Age",
                    textInputType: TextInputType.number,
                    onChanged: (pass) {
                      _age = pass;
                      setState(() {});
                    },
                  ),
                  CustomDropdownButton(
                    enumList: Country.values,
                    value: _country,
                    onChanged: (value) {
                      _country = Country.values[value?.index ?? 0];
                      setState(() {});
                    },
                    label: 'Nationality',
                  ),
                  widget.userType == UserType.Tourist
                      ? const SizedBox()
                      : CustomDropdownButton(
                          enumList: Country.values,
                          value: _countryOfResidence,
                          onChanged: (value) {
                            _countryOfResidence =
                                Country.values[value?.index ?? 0];
                            setState(() {});
                          },
                          label: 'Country Of Residence',
                        ),
                  const Text(
                    "Speaking Languages",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MultiSelectDropDownMenu(
                    onChanged: (values) {
                      _languages = values;
                      setState(() {});
                    },
                    options: Languages.values.map((e) => e.name).toList(),
                    selectedValues: _languages,
                    hint: 'Select Language',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.userType == UserType.Tourist
                      ? const SizedBox()
                      : Column(
                          children: [
                            const Text(
                              "Experience",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            AppTextFormFiled(
                              hintText: "Experience",
                              labelText: "Experience",
                              textInputType: TextInputType.number,
                              onChanged: (experience) {
                                _experience = experience;
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  AppTextFormFiled(
                    hintText: "Phone Number",
                    labelText: "Enter Phone Number",
                    textInputType: TextInputType.phone,
                    onChanged: (phone) {
                      _phoneNumber = phone;
                      setState(() {});
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: CustomButton(
                      onPressed: _registerFun,
                      text: "Next",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerFun() {
    if (_formKey.currentState!.validate()) {
      _setLogInUseCase(true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HostPage(),
          ));
    }
  }
}
