import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Everything the user adds to the list is a task.
//Task provider is self explanatory and its job is being the provider for the project.

class Task {
  final String id;
  String description;
  DateTime dueDate;
  bool isDone;
  int mode;

  Task({
    @required this.id,
    @required this.description,
    this.dueDate,
    this.isDone = false,
    this.mode,
  });
}

class TaskProvider with ChangeNotifier {
  List<Task> get itemsList {
    return _toDoList;
  }

  final List<Task> _toDoList = [
    Task(
      id: 'task#1',
      description: 'Create my models',
      dueDate: DateTime.now(),
      mode: 2,
    ),
    Task(
      id: 'task#2',
      description: 'Add provider',
      dueDate: DateTime.now(),
      mode: 1,
    ),
  ];

  Task getById(String id) {
    return _toDoList.firstWhere((task) => task.id == id);
  }

  void createNewTask(Task task) {
    final newTask = Task(
      id: task.id,
      description: task.description,
      dueDate: task.dueDate,
    );
    _toDoList.add(newTask);
    notifyListeners();
  }

  void editTask(Task task) {
    int index = _toDoList.indexWhere((_task) => _task.id == task.id);
    _toDoList[index].mode = task.mode;
    _toDoList[index].description = task.description;
    _toDoList[index].dueDate = task.dueDate;
    notifyListeners();
  }

  void removeTask(String id) {
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _toDoList.indexWhere((task) => task.id == id);
    _toDoList[index].isDone = !_toDoList[index].isDone;
    //print('PROVIDER ${_toDoList[index].isDone.toString()}');
  }
}
