import 'package:get/get.dart';
import '../todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title) {
    todos.add(Todo(
      title: title,
    ));
  }

  void updateTodoTitle(int index, String newtitle) {
    var todo = todos[index];
    todo.title = newtitle;
    todos[index] = todo;
  }

  void toggleTodoStatus(int index) {
    var todo = todos[index];
    todo.isDone = !todo.isDone;
    todos[index] = todo; // Update the item in the list to trigger reactivity
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
