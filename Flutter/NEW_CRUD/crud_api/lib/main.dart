import 'package:crud_api/crud_with_restAPI.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CrudWithRestapi(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class CrudWithRestapi extends StatefulWidget {
//   const CrudWithRestapi({super.key});
//
//   @override
//   State<CrudWithRestapi> createState() => _CrudWithRestapiState();
//
// }
//
// class _CrudWithRestapiState extends State<CrudWithRestapi> {
//
//   List<Map<String,dynamic>> dataList=[];
//   TextEditingController nameController=TextEditingController();
//   String baseUrl='https://67c5c06d351c081993fb4b23.mockapi.io/temp';
//   final _formkey=GlobalKey<FormState>();
//
//   //get all the data from api
//   Future<void> getAll() async {
//     var res = await http.get(Uri.parse(baseUrl));
//     // List<dynamic> data=await jsonDecode(res.body);
//     // return data;
//     setState(() {
//       dataList = List<Map<String, dynamic>>.from(jsonDecode(res.body));
//     });
//   }
//
//   //add data in api
//   Future<void> addData(Map<String,dynamic> map) async{
//     var res=await http.post(
//         Uri.parse(baseUrl),
//         headers: <String,String>{
//           'Content-Type':'application/json; '
//         },
//         body:jsonEncode(map)
//     );
//     getAll();
//   }
//
//   Future<void> updateData(String id,Map<String,dynamic> map)async{
//     var res=await http.put(
//         Uri.parse('$baseUrl/$id'),
//         headers: <String,String>{
//           'Content-Type':'application/json;'
//         },
//         body:jsonEncode(map)
//     );
//     getAll();
//   }
//   Future<void> deleteData(String id)async{
//     var res=await http.delete(Uri.parse('$baseUrl/$id'));
//     getAll();
//   }
//   void showSheet(BuildContext context,{String? id,String? name}){
//     nameController.text=name??'';
//     showModalBottomSheet(
//         context: context,
//         builder: (context){
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                     labelText: 'Name'
//                 ),
//                 validator: (value){
//                   if(value==null || value.isEmpty){
//                     return 'Enter name please';
//                   }
//                 },
//               ),
//               SizedBox(height: 10,),
//               ElevatedButton(
//                   onPressed: ()async{
//                     String newName=nameController.text;
//                     if(_formkey.currentState?.validate() ?? false){
//                       if(id==null){
//                         await addData({'name':newName});
//                       }
//                       else{
//                         await updateData(id as String, {'name':newName});
//                       }
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text(id==null ? 'ADD DATA' : 'EDIT DATA'))
//             ],
//           );
//         });
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     getAll();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CRUD WITH RESTAPI'),
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                       height: 4000,
//                       child:dataList.isEmpty ?
//                       Center(child: CircularProgressIndicator(),)
//                           :
//                       ListView.builder(
//                           itemCount: dataList.length,
//                           itemBuilder: (context,index){
//                             return ListTile(
//                               leading: CircleAvatar(
//                                 child: Text(dataList[index]['id'].toString()),
//                               ),
//                               title: Text(dataList[index]['name']),
//                               trailing: SizedBox(
//                                 width: 100,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     IconButton(
//                                       onPressed: () {
//                                         showSheet(
//                                           context,
//                                           id: dataList[index]['id'] ,
//                                           name: dataList[index]['name'],
//                                         );
//                                       },
//                                       icon: const Icon(Icons.edit),
//                                     ),
//                                     IconButton(
//                                       onPressed: () async {
//                                         await deleteData(dataList[index]['id'].toString());
//                                       },
//                                       icon: const Icon(CupertinoIcons.delete_solid),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           })
//                   )
//                 ],
//               ),
//             ),
//           )
//       ),
//       floatingActionButton: ElevatedButton(
//           onPressed: (){
//             showSheet(context);
//           },
//           child: Icon(CupertinoIcons.add)),
//     );
//   }
// }
