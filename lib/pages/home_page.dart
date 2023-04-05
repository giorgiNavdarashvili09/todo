import 'package:flutter/material.dart';
import 'package:todo/data_models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<Todo> todos = [];

  List<Widget> getTodoWidgets() {
    List<Widget> temp = [];

    for (int i = 0; i < todos.length; i++) {
      temp.add(
        Column(
        children: [
          Text(todos[i].title),
          Text(todos[i].description),
        ],

      ),);
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "description"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.add(
                    Todo(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );
                });
                titleController.clear();
                descriptionController.clear();
              },
              child: const Text("Add"),
            ),
            SizedBox(
              child: ListView(
                children: getTodoWidgets(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
