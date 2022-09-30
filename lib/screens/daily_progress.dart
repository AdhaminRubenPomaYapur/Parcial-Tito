import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/screens/screens.dart';

class DailyProgressScreen extends StatelessWidget {
  const DailyProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        appBar: AppBar(
            title: const Text("Mis Progresos"),
            backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            elevation: 0,
            shadowColor: null,
            bottomOpacity: 0,
            // ignore: prefer_const_constructors
            leading: IconButton(
                onPressed: () => {}, icon: const Icon(Icons.arrow_back))),
        body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  width: 80,
                  child: Card(
                    color: const Color.fromARGB(255, 96, 96, 96),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {},
                      child: const SizedBox(
                        width: 300,
                        height: 80,
                        child: Center(
                            child: Text(
                          'Mi Progreso SEXOOO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
