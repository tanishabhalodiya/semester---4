import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/rest_API/apiService.dart';

class TodoApi extends StatefulWidget {
  const TodoApi({super.key});

  @override
  State<TodoApi> createState() => _TodoApiState();
}

class _TodoApiState extends State<TodoApi> {
  ApiService apiTodo = ApiService();
  List<dynamic> _tasks = [];

  @override
  void initState() {
    super.initState();
    _refreshTasks();
  }

  /// Refresh the task list
  void _refreshTasks() async {
    List tasks = await apiTodo.getAllTodo();
    setState(() {
      _tasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO WITH API'),
      ),
      body: FutureBuilder(
        future: apiTodo.getAllTodo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<dynamic> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['desc']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showAddTaskDialog(
                            context,
                            id: data[index]['id'],
                            title: data[index]['title'],
                            desc: data[index]['desc'],
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await apiTodo.deleteTodo(data[index]['id']);
                          _refreshTasks();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No TODOs found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, {String? id, String? title, String? desc}) {
    final titleController = TextEditingController(text: title ?? '');
    final descController = TextEditingController(text: desc ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(id == null ? 'Add New Task' : 'Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty) {
                  if (id == null) {

                    await apiTodo.addTodo(
                      titleController.text,
                      descController.text,
                    );
                  } else {

                    await apiTodo.editTodo(
                      id,
                      titleController.text,
                      descController.text,
                    );
                  }
                  _refreshTasks();
                  Navigator.pop(context);
                }
              },
              child: Text(id == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}