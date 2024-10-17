import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldController,
    required this.fieldName,
    this.focusNode,
    required this.autoFocus,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.textInputAction,
    this.onChanged,
    required this.isReadOnly,
    required this.validator,
    required this.obscureText,
    this.onTap,
  });

  final TextEditingController fieldController;
  final String fieldName;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final bool isReadOnly;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        controller: fieldController,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: autoFocus,
        obscureText: obscureText,
        readOnly: isReadOnly,
        textInputAction: textInputAction,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: fieldName,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
