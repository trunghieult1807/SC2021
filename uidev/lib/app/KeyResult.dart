import 'package:uidev/app/Item.dart';
import 'package:uidev/app/Task.dart';

class KeyResult extends Item {
  static int _idCount = 1;
  DateTime _deadline;
  List<Task> _taskList = [];

  KeyResult(String desc, DateTime deadline) : _deadline = deadline, super(desc) {
    this.id = _idCount++;
    print("KeyResult #${this.id}: Created Successfully!");
  }

  String toString() {
    return "KeyResult ${this.id}: ${this.description}, $_deadline - ${this.isDone ? "Done" : "In progress"}";
  }

  // A bunch of setter and getter functions
  DateTime get deadline => _deadline;
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