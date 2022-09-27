import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/style/text_form_field_decoration.dart';


class CustomTextFormFieldLogin extends StatelessWidget {

  final IconData                    icon;
  final String                      hintext;
  final TextInputType?              keyboardType;
  final TextInputAction             textInputAction;
  final bool?                       obscureText;
  final String? Function(String?)?  validator;
  final TextEditingController?      controller;

  const CustomTextFormFieldLogin({
    Key? key, 
    required this.icon, 
    required this.hintext, 
    this.keyboardType, 
    required this.textInputAction, 
    this.obscureText, 
    this.validator, 
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 12 ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600]?.withOpacity(0.5) ?? Colors.grey,
          borderRadius: BorderRadius.circular(16)
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric( vertical: 20 ),
            border: InputBorder.none,
            hintText: hintext,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20.0),
              child: Icon(
                icon, 
                color: Colors.white, 
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          validator: validator,
        ),
      ),
    );
  }
}