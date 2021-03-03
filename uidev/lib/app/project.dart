import 'package:flutter/material.dart';
import 'package:uidev/app/item.dart';
import 'package:uidev/app/task.dart';

class Project extends Item {
  Color _color;
  String _createdDate;
  DateTime _deadline;
  List<Task> _taskList = [];
  double _progressPercent = 0;

  Project(String id, String title, String desc, String createdDate, DateTime deadline, Color color) : _createdDate = createdDate ,_deadline = deadline, _color = color, super(id, title, desc);

  String toString() {
    return "KeyResult ${this.id}: ${this.title} - ${this.description}, $_deadline - ${this.isDone ? "Done" : "In progress"}";
  }

  // A bunch of setter and getter functions
  String get createdDate => _createdDate;
  DateTime get deadline => _deadline;
  Color get color => _color;
  double get progressPercent => _progressPercent;
  List<Task> get allTask => _taskList;
  set deadline(DateTime _in) => _deadline = _in;

  // Add Task object to TaskList of Key Result
  void addTask(Task task) {
    if (_taskList.contains(task)) {
      print("Task #${task.id} already in KeyResult #${this.id}");
      return null;
    }
    _taskList.add(task);
  }
  // Add many Task objects simultaneously
  void addManyTasks(List<Task> manyTasks) {
    manyTasks.forEach((task) => this.addTask(task));
  }

  Task removeTask(int taskId) {
    for (var i = 0; i < _taskList.length; i++) {
      if (taskId == _taskList[i].id) {
        return _taskList.removeAt(i);
      }
    }
    return null;
  }
  @override
  bool markDone() {
    if (this.isDone) return true;
    _taskList.forEach((task) {
      if (!task.isDone) return false;
    });
    super.markDone();
    return true;
  }
}