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
      final actual = Validator.validatorName('IPhone 7 plus');
      expect(actual, null);
    });
  });

  group('validated price', () {
    test('price null or empty', () {
      final actual = Validator.validatorPrice('');
      expect(actual, 'price null or empty');
    });
    test('valid price fix eight digits', () {
      final actual = Validator.validatorPrice('789.3');
      expect(actual, null);
    });
  });

  group('validated stock', () {
    test('stock null or empty', () {
      final actual = Validator.validatorStock('');
      expect(actual, 'stock null or empty');
    });
    test('valid stock', () {
      final actual = Validator.validatorStock('7855');
      expect(actual, null);
    });
  });
}