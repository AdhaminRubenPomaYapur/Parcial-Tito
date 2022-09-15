import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/originals/f5/20/da/f520dab6c667e0fe37134be9c2dc08f6.jpg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/messi.jpg'),
                    radius: 80,
                  ),
                ),
                const SizedBox(height: 50),
                const Text.rich(TextSpan(
                    text: 'Lionel Messi 10\n',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Lionel Messi The best Player',
                          style: TextStyle(fontSize: 10))
                    ])),
                const SizedBox(height: 80),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: const Text(
                    "Edit profile",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
