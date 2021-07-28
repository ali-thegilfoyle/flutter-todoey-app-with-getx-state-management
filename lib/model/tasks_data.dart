import 'package:get/get.dart';

class Tasks extends GetxController {
  final tasks = [
    Task(title: 'Develop an app'.obs, isChecked: false.obs),
    Task(title: 'Read a book'.obs, isChecked: false.obs),
    Task(title: 'Go to gym'.obs, isChecked: false.obs),
  ].obs;

  addTask({String task, bool isChecked}) {
    tasks.add(Task(title: task.obs, isChecked: isChecked.obs));
  }
}

class Task extends GetxController {
  RxString title;
  RxBool isChecked;

  Task({this.title, this.isChecked});
}
