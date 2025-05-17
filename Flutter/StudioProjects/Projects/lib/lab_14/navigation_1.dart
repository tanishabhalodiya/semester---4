  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

  class Navigation1 extends StatelessWidget {
    const Navigation1({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "NAVIGATION_WITH_MATERIAL_PAGE_ROUTE",
        home: HomePage(),
      );
    }
  }

  class HomePage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => SecondPage())
                );
              },
              child: Text('go to Second page')),
        ),
      );
    }
  }

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('go to Home page')),
      ),
    );
  }

}