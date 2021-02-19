import 'package:uidev/app/Item.dart';
import 'package:uidev/app/Task.dart';

class KeyResult extends Item {
  DateTime _deadline;
  List<Task> _taskList = [];

  KeyResult(String desc, DateTime deadline) : _deadline = deadline, super(desc) {
    print("KeyResult created!");
  }

  // A bunch of setter and getter functions
  DateTime get deadline => _deadline;
  List<Task> get allTask => _taskList;
  set deadline(DateTime _in) => _deadline = _in;

  void addTask(Task task) {
    _taskList.add(task);
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
    for (var i = 0; i < _taskList.length; i++) {
      if (!_taskList[i].isDone) return false;
    }
    super.markDone();
    return true;
  }
}