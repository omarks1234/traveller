import 'package:flutter/cupertino.dart';

class Dialog extends StatelessWidget{
  String title ; 
  String content ; 
  Dialog({super.key, required this.title, required this.content});
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            if (title == "Location is disabled") {

              Navigator.of(context).pop();
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}