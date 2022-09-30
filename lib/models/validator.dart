class Validator {
  final String email;
  final String password;

  Validator({
    required this.email,
    required this.password
  });

  static String? validatorEmail(String? value) {
    if(value?.isEmpty ?? true){
      return 'email null or empty';
    }
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un email válido';
  }

  static String? validatorPassword(String? value){
    if(value?.isEmpty ?? true){
      return 'password null or empty';
    }
    String pattern = r'^[a-zA-Z0-9@#$%&]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un password valido';
  }

  static String? validatorName(String? value){
    if(value?.isEmpty ?? true){
      return 'name null or empty';
    }
    String pattern = r'^[a-zA-z0-9+ ]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduzca un nombre valido';
  }

  static String? validatorPrice(String? value){
    if(value?.isEmpty ?? true){
      return 'price null or empty';
    }
    String pattern = r'^[0-9.,]{0,6}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un precio valido';
  }

  static String? validatorStock(String? value){
    if(value?.isEmpty ?? true){
      return 'stock null or empty';
    }
    String pattern = r'^[0-9]{0,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Introduce un stock valido';
  }

}