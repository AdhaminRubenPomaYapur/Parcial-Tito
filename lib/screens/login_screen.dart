import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff340501),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/landscape.jpg'), 
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity, 
                height: size.height * 0.5,
                child: Column(
                  children: [
                    Text('Welcome App Flutter', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.amber[600])),
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 40.0, vertical: 20 ),
                      child: TextFormField(
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          hintStyle: const TextStyle( color: Colors.white ),
                          labelStyle: const TextStyle( color: Colors.white),
                          icon: Icon(Icons.email, color: Colors.yellow[700],),
                        ),
                        validator: (value) {
                          return value != null && value.contains('@') ? 'Do not use the @ char.' : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 40.0, vertical: 20 ),
                      child: TextFormField(
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          hintStyle: const TextStyle( color: Colors.white ),
                          labelStyle: const TextStyle( color: Colors.white),
                          icon: Icon(Icons.verified_user, color: Colors.yellow[700],),
                          
                        ),
                        validator: (value) {
                          return value != null && value.contains('@') ? 'Do not use the @ char.' : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 44, 88, 84),
                              Color.fromARGB(255, 52, 70, 88),
                              Color.fromARGB(255, 60, 71, 71)
                            ]
                          )
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.yellow[800],
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle( fontSize: 20 )
                          ), 
                          child: const Text('Login'),
                        ),
                      ),
                    )
                  ]
                ),
              )
            )
          ],
        ),
      )
    );
  }
}