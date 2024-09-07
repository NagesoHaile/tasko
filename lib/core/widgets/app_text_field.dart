// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.label,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
    this.maxLength,
    this.maxLines,
    this.initialValue,
    this.inputFormatters,
  });
  final TextEditingController? controller;
  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        counterText: "",
        label: Text(
          label,
          textAlign: TextAlign.start,
        ),
        hoverColor: Colors.black,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      maxLength: maxLength,
    );
  }
}
