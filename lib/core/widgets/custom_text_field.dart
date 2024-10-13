import 'package:characters_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String placeholderText;
  final bool? isPassword;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomTextField(
      {this.textEditingController,
      super.key,
      required this.placeholderText,
      this.onChange,
      this.isPassword,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return "Enter Your Password";
            }
            return null;
          },
      onChanged: widget.onChange,
      obscureText: widget.isPassword ?? false,
      decoration: InputDecoration(
          enabled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          filled: true,
          hintText: widget.placeholderText,
          fillColor: AppColors.white,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 10),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}
