import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelectDropDownMenu extends StatelessWidget {
  const MultiSelectDropDownMenu(
      {Key? key,
      required this.onChanged,
      required this.options,
      required this.selectedValues, required this.hint})
      : super(key: key);

  final void Function(List<String>) onChanged;
  final List<String> options;
  final List<String> selectedValues;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12.0),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      selected_values_style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      options: options,
      selectedValues: selectedValues,
      whenEmpty: hint,
      // validator: (selectedOptions) {
      //   if(selectedOptions?.isEmpty ?? false){
      //     return "Field cant be empty";
      //   }
      //   return '';
      // },
    );
  }
}
