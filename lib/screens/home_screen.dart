import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.todos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.note_alt_outlined, size: 80, color: Colors.grey),
                SizedBox(height: 15),
                Text(
                  "No data found",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                SizedBox(height: 5),
                Text("Click + to add a todo", style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];

            final String title = todo['title'] ?? '';
            final bool isCompleted = todo['isCompleted'] ?? false;

            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              elevation: 2,
              child: ListTile(
                // CHECKBOX
                leading: Checkbox(
                  value: isCompleted,
                  onChanged: (value) {
                    controller.toggleTodo(index);
                  },
                ),

                // TODO TITLE
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    color: isCompleted ? Colors.grey : Colors.black,
                  ),
                ),

                // EDIT + DELETE
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // EDIT
                    IconButton(
                      onPressed: () {
                        showEditTodoDialog(context, controller, index, title);
                      },
                      icon: const Icon(Icons.edit, color: Colors.blue),
                    ),

                    // DELETE
                    IconButton(
                      onPressed: () {
                        showDeleteDialog(context, controller, index);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),

      // ADD TODO
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          showAddTodoDialog(context, controller);
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  // ==============================
  // ADD TODO DIALOG
  // ==============================

  void showAddTodoDialog(BuildContext context, TodoController controller) {
    final TextEditingController textController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text("Add Todo"),

        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter todo", border: OutlineInputBorder()),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {
              if (textController.text.trim().isEmpty) {
                Get.snackbar("Error", "Please enter todo", snackPosition: SnackPosition.BOTTOM);
                return;
              }

              await controller.addTodo(textController.text);

              Get.back();

              Get.snackbar("Success", "Todo added successfully", snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // ==============================
  // EDIT TODO DIALOG
  // ==============================

  void showEditTodoDialog(BuildContext context, TodoController controller, int index, String oldTitle) {
    final TextEditingController textController = TextEditingController(text: oldTitle);

    Get.dialog(
      AlertDialog(
        title: const Text("Edit Todo"),

        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter todo", border: OutlineInputBorder()),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {
              if (textController.text.trim().isEmpty) {
                Get.snackbar("Error", "Todo cannot be empty", snackPosition: SnackPosition.BOTTOM);
                return;
              }

              await controller.updateTodo(index, textController.text);

              Get.back();

              Get.snackbar("Success", "Todo updated successfully", snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  // ==============================
  // DELETE DIALOG
  // ==============================

  void showDeleteDialog(BuildContext context, TodoController controller, int index) {
    Get.dialog(
      AlertDialog(
        title: const Text("Delete Todo"),

        content: const Text("Are you sure you want to delete this todo?"),

        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              await controller.deleteTodo(index);

              Get.back();

              Get.snackbar("Deleted", "Todo deleted successfully", snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
