class Calculator {

  double add(double a, double b) => a + b;
  double substract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if(b == 0 ) throw ArgumentError('You cannot divide by zero');
    return a / b;
  }
  Future<double> divideFuture(double a, double b) async{
    return await Future.delayed( const Duration( seconds: 2 ), () => a/b );
  }

}