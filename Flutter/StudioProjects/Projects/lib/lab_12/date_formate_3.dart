import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormate3 extends StatelessWidget {
  const DateFormate3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DATE-FORMATE'),
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: TextStyle(fontSize: 20,color: Colors.pink),
              ),
            ),
          ),
          Center(
            child: Expanded(
              child: Text(DateFormat('dd-MM-yyyy ').format(DateTime.now())
              ),
            ),
          ),
          Center(
            child: Expanded(
              child: Text(DateFormat('dd-MMM-yyyy').format(DateTime.now())),
            ),
          ),
          Center(
            child: Expanded(
              child: Text(DateFormat('dd-MM-yy').format(DateTime.now())),
            ),
          ),
          Center(
            child: Expanded(
              child: Text(DateFormat('dd MMM, yyyy').format(DateTime.now())),
            ),
          )
        ],
      ),
    );
  }
}
