import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/style/text_form_field_decoration.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: Center(
        child: Text(
          'Welcome to App', 
          style: kHeading,
        )
      ),
    );
  }
}