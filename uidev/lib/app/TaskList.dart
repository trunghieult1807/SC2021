import 'package:uidev/app/Item.dart';
import 'package:uidev/app/Task.dart';
import 'package:uidev/app/Timeline.dart';

class TaskList extends Item {
  static int _idCount = 0;
  DateTime _deadline;
  List<Task> _taskList = [];

  TaskList(DateTime deadline) : _deadline = deadline, super(null) {
    this.id = _idCount++;
    print("TaskList #${this.id}: Created Successfully!");
  }

  String toString() {
    return "TaskList ${this.id}: $_deadline - ${this.isDone ? "Done" : "In progress"}";
  }

  // A bunch of setter and getter functions
  DateTime get deadline => _deadline;
  List<Task> get allTask => _taskList;
  set deadline(DateTime _in) => _deadline = _in;

  // Add Task object to TaskList of Key Result
  void addTask(Task task) {
    if (_taskList.contains(task)) {
      print("Task #${task.id} already in TaskList #${this.id}");
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

  // Method----------------------------------------------------------
  Timeline generateTimeline() {
    Timeline timeline = Timeline(_deadline);
    
    _taskList.forEach((task) {
      if (!task.isDone && task.mode.important && task.mode.urgent) {
        timeline.addPhase1Task(task);
      }
      else if (!task.isDone && task.mode.important) {
        timeline.addPhase2Task(task);
      }
      else if (!task.isDone && task.mode.urgent) {
        timeline.addPhase3Task(task);
      }
      else if (!task.isDone) {
        timeline.addExtraTask(task);
      }
    });

    return timeline;
  }

  double getProgressPercent() {
    int workDone = 0;
    int allWork = 0;
    _taskList.forEach((task) {
      if (task.isDone) {
        workDone += task.mode.priority;
      }
      allWork += task.mode.priority;
    });
    return workDone / allWork * 100;
  }
}
// import 'package:uidev/app/item.dart';
// import 'package:uidev/app/task.dart';
// import 'package:uidev/app/Timeline.dart';
//
// class TaskList extends Item {
//   static int _idCount = 0;
//   DateTime _deadline;
//   List<Task> _taskList = [];
//
//   TaskList(DateTime deadline) : _deadline = deadline, super(null) {
//     this.id = _idCount++;
//     print("TaskList #${this.id}: Created Successfully!");
//   }
//
//   String toString() {
//     return "TaskList ${this.id}: $_deadline - ${this.isDone ? "Done" : "In progress"}";
//   }
//
//   // A bunch of setter and getter functions
//   DateTime get deadline => _deadline;
//   List<Task> get allTask => _taskList;
//   set deadline(DateTime _in) => _deadline = _in;
//
//   // Add Task object to TaskList of Key Result
//   void addTask(Task task) {
//     if (_taskList.contains(task)) {
//       print("Task #${task.id} already in TaskList #${this.id}");
//       return null;
//     }
//     _taskList.add(task);
//   }
//   // Add many Task objects simultaneously
//   void addManyTasks(List<Task> manyTasks) {
//     manyTasks.forEach((task) => this.addTask(task));
//   }
//
//   Task removeTask(int taskId) {
//     for (var i = 0; i < _taskList.length; i++) {
//       if (taskId == _taskList[i].id) {
//         return _taskList.removeAt(i);
//       }
//     }
//     return null;
//   }
//   @override
//   bool markDone() {
//     if (this.isDone) return true;
//     _taskList.forEach((task) {
//       if (!task.isDone) return false;
//     });
//     super.markDone();
//     return true;
//   }
//
//   // Method----------------------------------------------------------
//   Timeline generateTimeline() {
//     Timeline timeline = Timeline(_deadline);
//
//     _taskList.forEach((task) {
//       if (!task.isDone && task.mode.important && task.mode.urgent) {
//         timeline.addPhase1Task(task);
//       }
//       else if (!task.isDone && task.mode.important) {
//         timeline.addPhase2Task(task);
//       }
//       else if (!task.isDone && task.mode.urgent) {
//         timeline.addPhase3Task(task);
//       }
//       else if (!task.isDone) {
//         timeline.addExtraTask(task);
//       }
//     });
//
//     return timeline;
//   }
// }
