import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/tasks_data.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var task;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            textAlign: TextAlign.center,
            onChanged: (_task) {
              task = _task;
            },
          ),
          SizedBox(height: 16),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Colors.lightBlueAccent,
            onPressed: () {
              Get.find<Tasks>().addTask(
                task: task,
                isChecked: false,
              );
              Get.back();
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
