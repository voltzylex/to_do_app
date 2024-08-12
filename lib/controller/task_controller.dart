import 'package:flutter/material.dart';
import 'package:to_do_application/models/task_model.dart';

class TaskController {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  ValueNotifier<List<Task>> tasks = ValueNotifier([]);
  void addTask(String title, BuildContext ctx) {
    if (title.isNotEmpty) {
      final updatedTasks = List<Task>.from(tasks.value);
      updatedTasks
          .add(Task(title: title, timestamp: DateTime.now().microsecond));
      tasks.value = updatedTasks;

      controller.clear();
    } else {
      const snackBar = SnackBar(
        content: Text('Please enter a new task'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
      focus.requestFocus();
    }
  }

  void toggleTaskCompletion(Task tas) {
    tas.isComplete = !tas.isComplete;
    tasks.value = List<Task>.from(tasks.value);
  }
}
