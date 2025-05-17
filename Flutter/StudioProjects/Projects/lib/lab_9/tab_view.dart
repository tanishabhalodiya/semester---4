import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  TabView({super.key});
  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  List<String> list=['tanisha','vruta','kunj'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('TAB VIEW')),
          bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Page1'),
                ),
                Tab(
                  child: Text('Page2'),
                )
              ]
          ),
        ),
        body: TabBarView(
            children: [
              Center(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('${list[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    ),
                  ],
                ),
              ),
              Center(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${list[index]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100)),
                    );
                  },
                  itemCount: (list.length)
                )
              )
            ]
        ),
      ),
    );
  }
}
