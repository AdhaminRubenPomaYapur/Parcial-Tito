import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _switchCurrentValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor:Colors.black,
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fill,
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
                const SizedBox(height: 30),
                const Text.rich(TextSpan(
                    text: 'Lionel Messi 10\n',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Lionel Messi The best Player',
                          style: TextStyle(fontSize: 10))
                    ])),
                const SizedBox(height: 50),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'carrito');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: const Text(
                    "Comprar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 60),
                Card(
                  color: const Color.fromARGB(255, 53, 130, 194),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.all(30),
                  elevation: 10,
                  child: Column(
                    children: [
                      const ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Text('Turn on Notifications'),
                        textColor: Colors.white,
                        leading: Icon(
                          Icons.music_note_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'dailyProgress');
                            },
                            child: const Text('hola'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 53, 130, 194),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.all(30),
                  elevation: 10,
                  child: Column(
                    children: [
                      const ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Text('Turn on Notifications'),
                        textColor: Colors.white,
                        leading: Icon(
                          Icons.music_note_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            value: _switchCurrentValue,
                            onChanged: (bool valueIn) {
                              setState(() {
                                _switchCurrentValue = valueIn;
                              });
                            },
                            focusColor: Colors.amber,
                            activeColor: Colors.green,
                            inactiveTrackColor: Colors.red,
                            hoverColor: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
