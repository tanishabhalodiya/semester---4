import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({super.key});

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('ActionBar with Menu'),
    actions: [
    // Menu icon in the app bar
      PopupMenuButton<String>(
        onSelected: (String value) {
        // Show an alert dialog when a menu item is selected
        _showAlertDialog(context);
        },
      itemBuilder: (BuildContext context) {
        return [
        PopupMenuItem<String>(
        value: 'Item 1',
        child: Text('Menu Item 1'),
        ),
        PopupMenuItem<String>(
        value: 'Item 2',
        child: Text('Menu Item 2'),
        ),
        ];
      },
      ),
    ],
    ),
    body: Center(
    child: Text('Main Content Goes Here'),
    ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('Menu Item Clicked'),
        content: Text('You clicked on the menu item.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          )
      ]
      );
    },
    );
}



