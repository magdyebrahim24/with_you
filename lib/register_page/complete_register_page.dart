

import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/custom_widgets/text_form_field.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/models/country.dart';
import 'package:with_me/filter/models/languages.dart';
import 'package:with_me/filter/widgets/drop_down_button.dart';
import 'package:with_me/home_page/ui/home_page.dart';

class CompleteRegisterPage extends StatefulWidget {
  const CompleteRegisterPage({Key? key}) : super(key: key);

  @override
  State<CompleteRegisterPage> createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _age;
  Country? _country;
  Languages? _language;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    style:  TextStyle(color: Colors.white, fontSize: 16),
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
                    style:  TextStyle(color: Colors.white, fontSize: 16),
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
                    style:  TextStyle(color: Colors.white, fontSize: 16),
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
                    }, label: 'Nationality',
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
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onPressed: _registerFun,
                    text: "Next",
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don\'t Have an Account?"),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Text(
                          "LogIn Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    }
  }
}
