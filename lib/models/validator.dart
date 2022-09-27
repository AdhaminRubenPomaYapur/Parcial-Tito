class Validator {
  final String email;
  final String password;

  Validator({
    required this.email,
    required this.password
  });

  static String? validatorName(String? value){
    String pattern = r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduzca un nombre valido';
  }

  static String? validatorEmail(String? value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un email válido';
  }

  static String? validatorPassword(String? value){
    String pattern = r'^[a-zA-Z0-9@#$%&]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un password valido';
  }

  static String? validatorPhoneNumer(String? value){
    String pattern = r'^[0-9]{8}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un telefono valido';
  }

  static String? validatorAddress(String? value){
    String pattern = r'^[a-zA-Z./#0-9ñÑ ]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduzca una direccion valida';
  }

}