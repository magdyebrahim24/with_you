import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, this.onChanged}) : super(key: key);

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppTextFormFiled(
        labelText: "Search",
        hintText: "Search",
        onChanged: onChanged,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leadingWidget: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
