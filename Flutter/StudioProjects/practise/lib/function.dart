import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class function extends StatefulWidget {
  const function({super.key});

  @override
  State<function> createState() => _formState();
}

class _formState extends State<function> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [
            Expanded(child:
            getColour(Colors.pink)
            ),
            Expanded(child:
            getColour(Colors.blue)
            )
          ],
        ),
    );

  }
  Widget getColour(Color c){
    return Expanded(
        child:
        Container(
          color: c,
        )
    );
  }
}
