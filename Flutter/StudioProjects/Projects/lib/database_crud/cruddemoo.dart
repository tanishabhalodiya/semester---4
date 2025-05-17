import 'package:flutter/material.dart';
import 'package:projects/database_crud/my_databse.dart';

class Cruddemoo extends StatefulWidget {
  const Cruddemoo({super.key});

  @override
  State<Cruddemoo> createState() => _CruddemooState();
}

class _CruddemooState extends State<Cruddemoo> {
  MyDatabase database =MyDatabase();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD 2'),
      ),
      body: FutureBuilder(
          future: database.fetchData(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      title: Text(snapshot.data![index]['title']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                await database.deleteData(snapshot.data![index]["id"]);
                                setState(() {

                                });
                              }, icon: Icon(Icons.delete,color: Colors.red,)),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      TextEditingController state = TextEditingController(
                                          text: snapshot.data![index]["title"]);
                                      return AlertDialog(
                                        title: Text("Edit"),
                                        content: TextField(
                                          controller: state,
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                await database.updateData({
                                                  "id": snapshot.data![index]
                                                  ["id"],
                                                  "title": state.text
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Edit"))
                                        ],
                                      );
                                    },
                                  ).then(
                                        (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                                icon: Icon(Icons.edit,color:Colors.blueGrey,),
                              ),
                            ],
                          ),
                      ),

                    );
                  }
              );
            }
            else{
              return Text('errorrrrrrrrrrrr');
            }
          }
          ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  TextEditingController title=TextEditingController();
                  return AlertDialog(
                    title: Text('add'),
                    content: TextField(
                      controller: title,
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            await database.insertData({"title": title.text});
                            Navigator.of(context).pop();
                          },
                          child: Text("Submit"))
                    ],
                  );
                }
            ).then((value){
              setState(() {

              });
            });
          },child: Icon(Icons.add),),
    );
  }
}
