import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_text_field.dart';
import '../controller/todocontroller.dart';

class TodoListScreen extends StatelessWidget {
  final TodoController _controller = Get.put(TodoController());
  final TextEditingController _textEditingController = TextEditingController();

  TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _textEditingController,
                    label: 'Add a new todo',
                    type: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _controller.addTodo(_textEditingController.text);
                      _textEditingController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = _controller.todos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 10,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () =>
                                _showEditDialog(context, index, todo.title),
                          ),
                          Checkbox(
                            value: todo.isDone,
                            onChanged: (value) {
                              _controller.toggleTodoStatus(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _controller.removeTodo(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index, String currentTitle) {
    final TextEditingController editController =
        TextEditingController(text: currentTitle);
    Get.defaultDialog(
      title: 'Edit Todo',
      content: Column(
        children: [
          TextField(
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'Edit todo',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (editController.text.isNotEmpty) {
                _controller.updateTodoTitle(index, editController.text);
                Get.back();
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
