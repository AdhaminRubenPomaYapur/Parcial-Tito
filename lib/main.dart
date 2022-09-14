import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ListView(
            children:  [ 
              DropdownButtonFormField<String>(
                value: 'Valor 1',
                items: const [
                  DropdownMenuItem(
                    value: 'Valor 1',
                    child: Text('Valor 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Valor 2',
                    child: Text('Valor 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Valor 3',
                    child: Text('Valor 3'),
                  )
                ], 
                onChanged: (value) {
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}