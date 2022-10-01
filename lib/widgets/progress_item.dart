import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../constants/colors.dart';

class ProgressItem extends StatelessWidget {
  final Progress progress;
  final onProgressChanged;
  final onDeleteItem;

  const ProgressItem({
    Key? key,
    required this.progress,
    required this.onProgressChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onProgressChanged(progress);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          progress.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
          progress.progressText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: progress.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              // print('Clicked on delete icon');
              onDeleteItem(progress.id);
            },
          ),
        ),
      ),
    );
  }
}
