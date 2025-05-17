import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CrudWithRestapi extends StatefulWidget {
  const CrudWithRestapi({super.key});

  @override
  State<CrudWithRestapi> createState() => _CrudWithRestapiState();

}

class _CrudWithRestapiState extends State<CrudWithRestapi> {

  List<Map<String,dynamic>> dataList=[];
  TextEditingController nameController=TextEditingController();
  String baseUrl='https://67c5c06d351c081993fb4b23.mockapi.io/temp';

  Future<void> getAll() async {
    var res = await http.get(Uri.parse(baseUrl));

    setState(() {
      dataList = List<Map<String, dynamic>>.from(jsonDecode(res.body));
    });
  }

  Future<void> addData(Map<String,dynamic> map) async{
    var res=await http.post(
        Uri.parse(baseUrl),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8'
        },
        body:jsonEncode(map)
    );
    getAll();
  }

  Future<void> updateData(String id,Map<String,dynamic> map)async{
    var res=await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8'
        },
        body:jsonEncode(map)
    );
    getAll();
  }
  Future<void> deleteData(String id)async{
    var res=await http.delete(Uri.parse('$baseUrl/$id'));
    getAll();
  }

  void showSheet(BuildContext context,{String? id,String? name}){
    nameController.text=name??'';
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name'
                )
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: ()async{
                    print('BUTTON I PRESSEDDDDDDDDDDDDDDDDDDDDDDDDDD');
                    String newName=nameController.text.trim();
                      if(id==null){
                        await addData({'name':newName});
                        print('DATA TO ADDDDDDDDDD:::::::::::::::::::: $newName');
                      }
                      else{
                        await updateData(id as String, {'name':newName});
                      }
                      Navigator.pop(context);
                  },
                  child: Text(id==null ? 'ADD DATA' : 'EDIT DATA'))
            ],
          );
        });
  }

  @override
  void initState(){
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD WITH RESTAPI'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(

              child: Column(
                children: [
                  SizedBox(
                      height: 4000,
                      child:dataList.isEmpty ?
                      Center(child: CircularProgressIndicator(),)
                          :
                      ListView.builder(
                          itemCount: dataList.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(dataList[index]['id'].toString()),
                              ),
                              title: Text(dataList[index]['name']),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showSheet(
                                          context,
                                          id: dataList[index]['id'] ,
                                          name: dataList[index]['name'],
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await deleteData(dataList[index]['id'].toString());
                                      },
                                      icon: const Icon(CupertinoIcons.delete_solid),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                  )
                ],
              ),
            ),
          )
      ),
      floatingActionButton: ElevatedButton(
          onPressed: (){
            showSheet(context);
          },
          child: Icon(CupertinoIcons.add)),
    );
  }
}
