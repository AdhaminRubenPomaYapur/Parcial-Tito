import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../constants/colors.dart';
import '../widgets/progress_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Colors.white,
  );
  final progressList = Progress.progressList();
  List<Progress> _foundProgress = [];
  final _progressController = TextEditingController();

  @override
  void initState() {
    _foundProgress = progressList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                      ),
                      for (Progress progreso in _foundProgress.reversed)
                        ProgressItem(
                          progress: progreso,
                          onProgressChanged: _handleProgressChange,
                          onDeleteItem: _deleteProgressItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _progressController,
                    decoration: const InputDecoration(
                        hintText: 'Agregar otro progreso',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    _addProgressItem(_progressController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.white)),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleProgressChange(Progress progress) {
    setState(() {
      progress.isDone = !progress.isDone;
    });
  }

  void _deleteProgressItem(String id) {
    setState(() {
      progressList.removeWhere((item) => item.id == id);
    });
  }

  void _addProgressItem(String progress) {
    setState(() {
      progressList.add(Progress(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        progressText: progress,
      ));
    });
    _progressController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<Progress> results = [];
    if (enteredKeyword.isEmpty) {
      results = progressList;
    } else {
      results = progressList
          .where((item) => item.progressText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundProgress = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Progresos',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      elevation: 0,
      title: const Text("Mis Progresos", style: TextStyle(fontSize: 30)),
    );
  }
}
