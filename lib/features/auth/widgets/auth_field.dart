import 'package:flutter/material.dart';
import 'package:twitter_w/theme/pallete.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final String? Function(String?)? validator;

  final TextInputType keyboardType;
  const AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    // required this.formatters,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      keyboardType: keyboardType,
      // inputFormatters: formatters,
      // onChanged: (val){
      //
      // },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Pallete.blueColor,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Pallete.greyColor),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
