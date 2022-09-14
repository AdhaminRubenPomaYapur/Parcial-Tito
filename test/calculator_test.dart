import 'package:parcial_flutter_testing/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Content testing function of class Calculator', () {
    test('the calculator return 4 when adding 2 and 2', () {
    //Assert
    final Calculator calculator = Calculator();

    //Arrange
    final result = calculator.add(2, 2);
    const double expected = 4;
    //Act
    expect(result, expected);
  });

    test('the calculator return 0 when substract 2 and 2', () {
      //Assert
      final Calculator calculator = Calculator();

      //Arrange
      final result = calculator.substract(2, 2);
      const double expected = 0;
      //Act
      expect(result, expected);
    });

    test('the calculator return 4 when multiply 2 and 2', () {
      //Assert
      final Calculator calculator = Calculator();

      //Arrange
      final result = calculator.add(2, 2);
      const double expected = 4;
      //Act
      expect(result, expected);
    });

    test('the calculator return 4 when divide 2 and 2', () {
      //Assert
      final Calculator calculator = Calculator();

      //Arrange
      final result = calculator.divide(2, 2);
      const double expected = 1;
      //Act
      expect(result, expected);
    });

    test('the calculator throws an ArgumentError when dividing by zero', () {
      //Assert
      final Calculator calculator = Calculator();

      //Arrange

      //Act
      expect(() => calculator.divide(2, 0), throwsArgumentError);
    });

    test('the calculator throws an ArgumentError when dividing by zero', () {
      //Assert
      final Calculator calculator = Calculator();

      //Arrange

      //Act
      expect(() => calculator.divide(2, 0), throwsArgumentError);
    });

    
  });

}