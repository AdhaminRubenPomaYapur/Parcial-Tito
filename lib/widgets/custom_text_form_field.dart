import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String label;
  final IconData icon;
  final String? initialValue;
  final TextEditingController controller;


  const CustomTextFormField({
    Key? key, 
    required this.label,
    required this.icon, 
    this.initialValue, 
    required this.controller, 
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
        controller: controller,
        initialValue: initialValue ?? '',
        decoration: InputDecoration(
          icon  : Icon(icon, color: Colors.white,),
          label : Text(label, style: const TextStyle( color: Colors.white),),
        ),
        style: const TextStyle( color: Colors.white, fontSize: 18 ),
      ),
    );
  }
}