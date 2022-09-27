import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/models.dart';
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
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: const [
                  TitleLogin(),
                  SizedBox( height: 120,),
                  _InputLoginWidget()
                ],
              ),
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
    final TextEditingController emailController    = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormFieldLogin(
                  icon            : Icons.email,
                  hintext         : 'Email',
                  keyboardType    : TextInputType.emailAddress,
                  textInputAction : TextInputAction.next,
                  validator       : Validator.validatorEmail,
                  controller      : emailController,
                ),
                CustomTextFormFieldLogin(
                  icon            : Icons.lock_outline,
                  hintext         : 'Password',
                  obscureText     : true,
                  textInputAction : TextInputAction.done,
                  validator       : Validator.validatorPassword,
                  controller      : passwordController,
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
                ButtomLogin( buttonText: 'Login', mykey: formKey,),
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
                ),
                const SizedBox( height: 50,)
              ],
            )
          ],
        ),
      ),
    );
  }
}