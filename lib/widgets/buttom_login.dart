import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/style/text_form_field_decoration.dart';
class ButtomLogin extends StatelessWidget {
  final String buttonText;
  
  const ButtomLogin({
    Key? key, 
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16)
      ),
      child: TextButton(
        onPressed: () {}, 
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            buttonText, 
            style: kBodyText,
          ),
        )
      ),
    );
  }
}
