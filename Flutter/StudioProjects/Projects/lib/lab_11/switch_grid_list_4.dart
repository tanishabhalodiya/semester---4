import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchGridList4 extends StatefulWidget {
  const SwitchGridList4({super.key});

  @override
  State<SwitchGridList4> createState() => _SwitchGridList4State();
}

class _SwitchGridList4State extends State<SwitchGridList4> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid-List-Toggle'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: isGrid ? Icon(CupertinoIcons.grid) : Icon(Icons.list)
            ),
          ],
        ),
        body: isGrid ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
            itemBuilder: (context,index){
              return Container(
                width: 100,
                height: 100,
                color: Colors.indigo,
              );
            },
          itemCount: 20)
            :
            ListView.builder(
              padding: EdgeInsets.all(8),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.indigo,
                    ),
                  );
                },itemCount: 20)
    );
  }
}
