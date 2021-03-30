import 'package:flutter/material.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/time_line.dart';

class ListTask{
  List<Task> listExercise;

  ListTask({this.listExercise});

  ListTask.fromJson(List<dynamic> data){
    data.map(
            (e) => e = Task.fromMap(e)).toList();

  }
}

class TaskList {
  String _id;
  String _title;
  String _desc;
  Color _color;
  DateTime _createdDate;
  DateTime _deadline;
  List<Task> _tasks;
  Timeline _timeline;

  TaskList(String id, String title, String desc, List<Task> tasks,
      DateTime createdDate, DateTime deadline, Color color)
      : _id = id,
        _title = title,
        _desc = desc,
        _tasks = tasks,
        _createdDate = createdDate,
        _deadline = deadline,
        _color = color,
        _timeline = Timeline(createdDate, deadline);



  TaskList.fromMap(Map<dynamic, dynamic> map)
      : _id = map["id"],
        _title = map["title"],
        _desc = map["desc"],
        _tasks = map["tasks"].map((e) {
          print("a$e");
          print("${Task.fromMap(e)}");
          // return Task.fromMap(e);
        }),
        _createdDate = map["createdDate"],
        _deadline = map["deadline"],
        _color = map["color"];

  List<Task> getImportantUrgentTasks() {
    // Get tasks which are important and urgent
    List<Task> tasks = [];
    _tasks.forEach((task) {
      if (task.mode.important && task.mode.urgent)
        tasks.add(task);
    });
    return tasks;
  }
  List<Task> getImportantTasks() {
    // Get tasks which are important but not urgent
    List<Task> tasks = [];
    _tasks.forEach((task) {
      if (task.mode.important && !task.mode.urgent)
        tasks.add(task);
    });
    return tasks;
  }
  List<Task> getUrgentTasks() {
    // Get tasks which are urgent but not important
    List<Task> tasks = [];
    _tasks.forEach((task) {
      if (!task.mode.important && task.mode.urgent)
        tasks.add(task);
    });
    return tasks;
  }
  List<Task> getExtraTasks() {
    // Get valueless tasks
    List<Task> tasks = [];
    _tasks.forEach((task) {
      if (!task.mode.important && !task.mode.urgent)
        tasks.add(task);
    });
    return tasks;
  }

  List<Task> getTaskByID(List<String> idList) {
    List<Task> tasks = [];
    _tasks.forEach((task) {
      if(idList.contains(task.id)){
        tasks.add(task);
      }
    });
    return tasks;
  }

  // Get Tasks for to-do list
  List<Task> getToDoTasks(DateTime date) {
    if (date.isBefore(_createdDate) || date.isAfter(_deadline)) {
      return [];
      //exit(-1);
    }
    // Group Tasks into 4 priority groups
    List<Task> important_urgent = [];
    List<Task> important = [];
    List<Task> urgent = [];
    List<Task> extra = [];

    _tasks.forEach((task) {
      if (!task.isDone) {
        if (task.mode.priority == 3)
          important_urgent.add(task);
        else if (task.mode.priority == 2)
          important.add(task);
        else if (task.mode.priority == 1)
          urgent.add(task);
        else
          extra.add(task);
      }
    });

    // Get tasks for the 'date'
    List<Task> todoTasks = [];
    if (date.isBefore(_timeline.phase1)) {
      if (important_urgent.length > 0)
        todoTasks.addAll(important_urgent);
      else if (important.length > 0)
        todoTasks.addAll(important);
      else if (urgent.length > 0)
        todoTasks.addAll(urgent);
      else if (extra.length > 0)
        todoTasks.addAll(extra);
    }
    else if (date.isBefore(_timeline.phase2)) {
      if (important_urgent.length > 0)
        todoTasks.addAll(important_urgent);
      if (important.length > 0)
        todoTasks.addAll(important);
      else if (urgent.length > 0)
        todoTasks.addAll(urgent);
      else if (extra.length > 0)
        todoTasks.addAll(extra);
    }
    else if (date.isBefore(_timeline.deadline)) {
      if (important_urgent.length > 0)
        todoTasks.addAll(important_urgent);
      if (important.length > 0)
        todoTasks.addAll(important);
      if (urgent.length > 0)
        todoTasks.addAll(urgent);
      else if (extra.length > 0)
        todoTasks.addAll(extra);
    }
    return todoTasks;
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
    return allWork == 0 ?  0 :  workDone / allWork ;
  }

  /* Compute something------------------------------------------ */
  double getLoadFactor(DateTime d) {
    // Compute 'load factor' = number_of_tasks / working_time_left
    // working_time_left in minutes
    if (_deadline.isBefore(d)) return 0;

    int timeleft = _deadline.difference(d).inMinutes;

    if (_tasks.length == 0) return 1;
    return _tasks.length / timeleft;
  }
  void updateTaskWeight(double loadFactor) {
    _tasks.forEach((task) {
      task.weight = loadFactor * (task.mode.priority + 1);
    });
  }
  //////////////////////////////////////////////////////////////////

  // A bunch of setter and getter functions
  String get id => _id;
  String get title => _title;
  String get desc => _desc;
  DateTime get createdDate => _createdDate;
  DateTime get deadline => _deadline;
  Color get color => _color;
  double get progressPercent {
    return getProgressPercent();
  }
  List<Task> get tasks => _tasks;
  int get length => _tasks.length;

  set deadline(DateTime _in) {
    _deadline = _in;
    _timeline = Timeline(DateTime.now(), _in);
  }
}
