import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/style/text_form_field_decoration.dart';
class ButtomLogin extends StatelessWidget {
  final String buttonText;
  final GlobalKey<FormState> mykey;
  const ButtomLogin({
    Key? key, 
    required this.buttonText, 
    required this.mykey,
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
        key: const ValueKey(""),
        onPressed: () {
          if(mykey.currentState?.validate() ?? false) {
            Navigator.pushReplacementNamed(context, 'listContacts');
          }
        }, 
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
