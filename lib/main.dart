import 'package:flutter/material.dart';
import 'package:flutter_todoey_app_with_getx_statemanagement/tasks_list.dart';
import 'package:get/get.dart';

import 'bottom_sheet.dart';
import 'model/tasks_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todoey with GetX State management',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 32.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Todoey With GetX',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GetX<Tasks>(
                    init: Tasks(),
                    builder: (_) {
                      return Text(
                        '${_.tasks.length} Tasks',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Get.bottomSheet(AddTask());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
