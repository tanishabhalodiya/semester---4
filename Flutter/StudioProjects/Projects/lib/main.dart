import 'package:flutter/material.dart';
import 'package:projects/calculator.dart';
import 'package:projects/database_crud/cruddemoo.dart';
import 'package:projects/database_crud/database_crud.dart';
import 'package:projects/lab_11/gridView2.dart';
import 'package:projects/lab_11/gridView_3.dart';
import 'package:projects/lab_11/list_of_city_1.dart';
import 'package:projects/lab_11/switch_grid_list_4.dart';
// import 'package:projects/lab_12/date_formate_3.dart';
import 'package:projects/lab_12/scrollable_grid_2.dart';
import 'package:projects/lab_13/bottom_navigation_bar_2.dart';
import 'package:projects/lab_14/navigation_1.dart';
import 'package:projects/lab_17/todo.dart';
import 'package:projects/lab_6/layout1.dart';
import 'package:projects/lab_6/layout3.dart';
import 'package:projects/lab_6/layout4.dart';
import 'package:projects/lab_6/layout5.dart';
import 'package:projects/lab_6/layout6.dart';
import 'package:projects/lab_6/layout7.dart';
import 'package:projects/lab_6/layout8.dart';
import 'package:projects/lab_6/layout9.dart';
import 'package:projects/lab_7/customWidget_2.dart';
import 'package:projects/lab_7/helloWithText_1.dart';
import 'package:projects/lab_7/lab7_p3.dart';
import 'package:projects/lab_7/lab7_p4.dart';
import 'package:projects/lab_7/lab7_p5.dart';
import 'package:projects/lab_8/birthdayCard.dart';
import 'package:projects/lab_10/form.dart';
import 'package:projects/lab_8/image_1.dart';
import 'package:projects/lab_8/onlineImage.dart';
import 'package:projects/lab_8/rollTheDice.dart';
import 'package:projects/lab_8/stack.dart';
import 'package:projects/lab_9/action_bar.dart';
import 'package:projects/practise/crud_with_database.dart';
import 'package:projects/practise/crud_with_restApi.dart';
import 'package:projects/practise/paper_layout1.dart';
import 'package:projects/rest_API/todo_api.dart';

import 'crud/design/list/user_list_page.dart';
import 'lab_12/scrollable_list_2.dart';
import 'lab_12/singleChildCrollview_1.dart';
import 'lab_13/bottom_sheet_1.dart';
import 'lab_6/layout2.dart';
import 'lab_8/birthdayCard_navigate.dart';
import 'lab_8/navigate.dart';
import 'lab_8/splash_screen_6.dart';
import 'lab_9/drawer_view2.dart';
import 'lab_9/tab_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Log output to the console
    print("App is running on the browser!");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Button pressed!");
              },
              child: Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
