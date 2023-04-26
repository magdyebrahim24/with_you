import 'package:flutter/material.dart';

class AppTextFormFiled extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final bool? isSecure;
  final Widget? leadingWidget;
  final EdgeInsetsGeometry? contentPadding;
  const AppTextFormFiled(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.textInputType,
      this.onChanged,
      this.isSecure, this.leadingWidget, this.contentPadding})
      : super(key: key);

  @override
  State<AppTextFormFiled> createState() => _AppTextFormFiledState();
}

class _AppTextFormFiledState extends State<AppTextFormFiled> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        obscureText: widget.isSecure == true ? isSecure : false,
        onChanged: widget.onChanged,

        textInputAction: TextInputAction.next,
        keyboardType: widget.textInputType,
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        validator: (value) {
          if (value == "" || value == null) {
            return "Field Cant Be Empty";
          }
          return null;
        },
        decoration: InputDecoration(contentPadding: widget.contentPadding,
            prefixIconConstraints: const BoxConstraints(maxWidth: 50,minWidth: 10),
            fillColor: Colors.white,
            prefixIcon: widget.leadingWidget,
            filled: true,
            // suffix: _secureAye(),
            suffixIcon: _secureAye(),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            // labelText: widget.labelText,
            hintText: widget.hintText,
            labelStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12))),
        maxLines: 1,
      ),
    );
  }

  Widget? _secureAye() {
    // return Text('data');
    // return Text('data');
    if (widget.isSecure == true && isSecure == true) {
      return GestureDetector(
        onTap: () {
          isSecure = false;
          setState(() {});
        },
        child: const Icon(
          Icons.visibility,
          color: Colors.black,
        ),
      );
    } else if (widget.isSecure == true && isSecure == false) {
      return GestureDetector(
        onTap: () {
          isSecure = true;
          setState(() {});
        },
        child: const Icon(
          Icons.visibility_off,
          color: Colors.black,
        ),
      );
    }
    return null;
  }
}
