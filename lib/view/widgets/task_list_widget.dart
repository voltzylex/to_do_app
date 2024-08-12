import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_application/controller/task_controller.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key, required this.controller});
  final TaskController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.tasks,
        builder: (context, value, _) {
          return Expanded(
            child: value.isEmpty
                ? const Center(
                    child: Text(
                      'No tasks yet. Add one!',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final task = value[index];
                      return Card(
                        color: Colors.white.withOpacity(0.85),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          leading: Checkbox(
                            value: task.isComplete,
                            onChanged: (value) {
                              controller.toggleTaskCompletion(task);
                            },
                            activeColor: Colors.blueAccent,
                          ),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "Time : ${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(task.timestamp))}",
                            style: TextStyle(
                              decoration: task.isComplete
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
