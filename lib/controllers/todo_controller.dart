import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoController extends GetxController {
  static const String boxName = 'todoBox';

  late Box todoBox;

  var todos = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    initHive();
  }

  Future<void> initHive() async {
    todoBox = await Hive.openBox(boxName);
    loadTodos();
  }

  // READ
  void loadTodos() {
    todos.clear();

    for (var item in todoBox.values) {
      todos.add(Map<String, dynamic>.from(item));
    }
  }

  // CREATE
  Future<void> addTodo(String title) async {
    if (title.trim().isEmpty) return;

    final todo = {'title': title.trim(), 'isCompleted': false};

    await todoBox.add(todo);
    loadTodos();
  }

  // UPDATE
  Future<void> updateTodo(int index, String newTitle) async {
    if (newTitle.trim().isEmpty) return;

    final key = todoBox.keyAt(index);

    final updatedTodo = {'title': newTitle.trim(), 'isCompleted': todos[index]['isCompleted'] ?? false};

    await todoBox.put(key, updatedTodo);
    loadTodos();
  }

  // UPDATE COMPLETION
  Future<void> toggleTodo(int index) async {
    final key = todoBox.keyAt(index);

    final updatedTodo = {'title': todos[index]['title'], 'isCompleted': !(todos[index]['isCompleted'] ?? false)};

    await todoBox.put(key, updatedTodo);
    loadTodos();
  }

  // DELETE
  Future<void> deleteTodo(int index) async {
    final key = todoBox.keyAt(index);

    await todoBox.delete(key);
    loadTodos();
  }
}
