class LoginValidator {
  final String email;
  final String password;

  LoginValidator({
    required this.email,
    required this.password
  });

  bool validatorEmail() {
    return email.isEmpty;
  }
}