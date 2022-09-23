import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String label;
  final IconData icon;
  final String initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;


  const CustomTextFormField({
    Key? key, 
    required this.label,
    required this.icon, 
    required this.initialValue, 
    this.onChanged, 
    this.validator, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white24,
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon  : Icon(icon, color: Colors.white,),
          label : Text(label, style: const TextStyle( color: Colors.white),),
        ),
        style: const TextStyle( color: Colors.white, fontSize: 18 ),
      ),
    );
  }
}