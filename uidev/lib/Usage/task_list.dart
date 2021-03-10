import 'package:flutter/material.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/time_line.dart';

class TaskList {
  String _id;
  String _title;
  String _desc;
  Color _color;
  DateTime _createdDate;
  DateTime _deadline;
  List<Task> _tasks;
  double _progressPercent = 0;

  TaskList(String id, String title, String desc, List<Task> tasks,
      DateTime createdDate, DateTime deadline, Color color)
      : _id = id,
        _title = title,
        _desc = desc,
        _tasks = tasks,
        _createdDate = createdDate,
        _deadline = deadline,
        _color = color;

  // Method----------------------------------------------------------
  Timeline generateTimeline() {
    Timeline timeline = Timeline(_deadline);
  
    _tasks.forEach((task) {
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
    _tasks.forEach((task) {
      if (task.isDone) {
        workDone += task.mode.priority;
      }
      allWork += task.mode.priority;
    });
    return workDone / allWork * 100;
  }


  // A bunch of setter and getter functions
  String get id => _id;
  String get title => _title;
  String get desc => _desc;
  DateTime get createdDate => _createdDate;
  DateTime get deadline => _deadline;
  Color get color => _color;
  double get progressPercent => _progressPercent;
  List<Task> get tasks => _tasks;

  set deadline(DateTime _in) => _deadline = _in;
}
