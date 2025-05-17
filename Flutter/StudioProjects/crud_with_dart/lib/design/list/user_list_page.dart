import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

         title: Text(
             'User list',
           style: TextStyle(
             fontSize: 20,
             color: Colors.white,
           ),
         ),
      ),
    );
  }
}
