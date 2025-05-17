import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/lab_17/database.dart';

class Todo extends StatefulWidget {
  Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Database_todo todo = Database_todo();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _refreshTasks(); // Load tasks when the app starts
  }

  /// Refresh the task list
  void _refreshTasks() async {
    List<Map<String, dynamic>> tasks = await todo.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  /// Sort by Name (A-Z)
  void sortBy_name_a_to_z() {
    setState(() {
      _tasks.sort((a, b) => a['title'].toString().toLowerCase().compareTo(b['title'].toString().toLowerCase()));
    });
  }

  /// Sort by Name (Z-A)
  void sortBy_name_z_to_a() {
    setState(() {
      _tasks.sort((a, b) => b['title'].toString().toLowerCase().compareTo(a['title'].toString().toLowerCase()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Sort by:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(CupertinoIcons.textformat_abc),
                              title: Text('Name (A-Z)'),
                              onTap: () {
                                sortBy_name_a_to_z();
                                Navigator.pop(context);
                              },
                              trailing: Icon(CupertinoIcons.arrow_down, color: Colors.blueGrey),
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.textformat_abc),
                              title: Text('Name (Z-A)'),
                              onTap: () {
                                sortBy_name_z_to_a();
                                Navigator.pop(context);
                              },
                              trailing: Icon(CupertinoIcons.arrow_up, color: Colors.blueGrey),
                            )
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(CupertinoIcons.sort_down, size: 30, color: CupertinoColors.darkBackgroundGray))
        ],
      ),
      body: _tasks.isEmpty
          ? Center(child: Text('No tasks available.'))
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          var task = _tasks[index];
          Color col;
          if (task[Database_todo.PRIO] == 1) {
            col = Colors.blue.shade200;
          } else if (task[Database_todo.PRIO] == 2) {
            col = Colors.pink.shade200;
          } else {
            col = Colors.deepPurple.shade200;
          }
          return Container(
            decoration: BoxDecoration(
              color: col,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              title: Text(task['title']),
              subtitle: Text(task['description'] ?? ''),
              trailing: Text('Priority: ${task['priority']}'),
              onLongPress: () async {
                await todo.deleteTask(task[Database_todo.ID]);
                _refreshTasks(); // Refresh tasks after deletion
              },
            ),
          );
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

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final prioController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task'),
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
              TextField(
                controller: prioController,
                decoration: InputDecoration(labelText: 'Priority'),
                keyboardType: TextInputType.number,
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
                if (titleController.text.isNotEmpty && prioController.text.isNotEmpty) {
                  await todo.addTask(
                    title: titleController.text,
                    desc: descController.text,
                    prio: int.parse(prioController.text),
                  );
                  _refreshTasks();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
