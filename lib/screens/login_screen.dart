import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/style/text_form_field_decoration.dart';
import 'package:parcial_flutter_testing/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: const [
                TitleLogin(),
                SizedBox( height: 100,),
                _InputLoginWidget()
              ],
            ),
          ),
        )
      ] 
    );
  }
}

class _InputLoginWidget extends StatelessWidget {
  const _InputLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomTextFormFieldLogin(
                icon            : Icons.email,
                hintext         : 'Email',
                keyboardType    : TextInputType.emailAddress,
                textInputAction : TextInputAction.next,
              ),
              const CustomTextFormFieldLogin(
                icon            : Icons.lock_outline,
                hintext         : 'Password',
                obscureText     : true,
                textInputAction : TextInputAction.done,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1
                    )
                  )
                ),
                child: const Text(
                  'Forgot Password?', 
                  style: kBodyText,
                )
              )
            ],
          ),
          Column(
            children: [
              const SizedBox( height: 60,),
              const ButtomLogin( buttonText: 'Login',),
              const SizedBox( height: 50,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1
                    )
                  )
                ),
                child: const Text('Create New Account', style: kBodyText,),
              )
            ],
          )
        ],
      ),
    );
  }
}