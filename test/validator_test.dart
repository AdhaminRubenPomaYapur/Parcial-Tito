import 'package:flutter_test/flutter_test.dart';
import 'package:parcial_flutter_testing/models/validator.dart';


void main() {

  group('validated email', () {
    test('email null or empty', () {
      final actual = Validator.validatorEmail('');
      expect(actual, 'email null or empty');
    });
    test('valid email', () {
      final actual = Validator.validatorEmail('adhamin@gmail.com');
      expect(actual, null);
    });
  });
  
  group('validated password', () {
    test('password null or empty', () {
      final actual = Validator.validatorPassword('');
      expect(actual, 'password null or empty');
    });
    test('valid password', () {
      final actual = Validator.validatorPassword('A@13478&3');
      expect(actual, null);
    });
  });

  group('validated Name', () {
    test('name null or empty', () {
      final actual = Validator.validatorName('');
      expect(actual, 'name null or empty');
    });
    test('valid name', () {
      final actual = Validator.validatorName('José Andrés Hurtado Vasquez');
      expect(actual, null);
    });
  });

  group('validated phone', () {
    test('phone null or empty', () {
      final actual = Validator.validatorPhoneNumer('');
      expect(actual, 'phone null or empty');
    });
    test('valid phone fix eight digits', () {
      final actual = Validator.validatorPhoneNumer('78964512');
      expect(actual, null);
    });
  });

  group('validated address', () {
    test('address null or empty', () {
      final actual = Validator.validatorAddress('');
      expect(actual, 'address null or empty');
    });
    test('valid address', () {
      final actual = Validator.validatorAddress('Calle Añez. Av. Litoral #60');
      expect(actual, null);
    });
  });
}