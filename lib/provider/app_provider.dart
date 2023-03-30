import 'package:flutter/material.dart';

import '../models/task.dart';

class AppProvider extends ChangeNotifier {
  List<Task>? tasks = [];

  void createTask(Task task) {
    tasks!.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    final index =
        tasks!.indexWhere((element) => element.subject == task.subject);
    notifyListeners();
  }

  void updateTask(Task task) {
    final index =
        tasks!.indexWhere((element) => element.subject == task.subject);
    print(index);
    tasks![index] = task;
    notifyListeners();
  }
}
