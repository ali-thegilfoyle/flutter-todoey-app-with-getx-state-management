import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Get.find<Tasks>().tasks;
    return Obx(() {
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Obx(() {
              return Text(
                task.title.value,
                style: TextStyle(
                  decoration:
                      task.isChecked.value ? TextDecoration.lineThrough : null,
                ),
              );
            }),
            trailing: Obx(() {
              return Checkbox(
                value: task.isChecked.value,
                activeColor: Colors.lightBlueAccent,
                onChanged: (value) {
                  task.isChecked.value = value;
                },
              );
            }),
            onLongPress: () {
              tasks.remove(task);
            },
          );
        },
      );
    });
  }
}
