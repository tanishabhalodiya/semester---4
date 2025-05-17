import 'package:flutter/material.dart';
import 'package:projects/lab_14/navigation_1.dart';

class Navigation2 extends StatefulWidget {
  const Navigation2({super.key});

  @override
  State<Navigation2> createState() => _Navigation2State();
}

class _Navigation2State extends State<Navigation2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NAVIGATION_WITH_NAME_ROUTE',
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/second':(context)=>SecondPage()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back to Home Page'),
        ),
      ),
    );
  }
}
