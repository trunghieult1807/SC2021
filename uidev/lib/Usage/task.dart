import 'package:uidev/Usage/task_mode.dart';
import 'package:uidev/Usage/task_timer.dart';

class Task {
  String _id;
  String _title;
  String _desc;
  TaskMode _mode;
  bool _isDone;
  int _duration;


  Task(String id, String title, String desc,
      int mode)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _isDone = false;


  Task.retrieve(String id, String title, String desc,
       int mode, bool isDone, int duration)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _isDone = isDone,
        _duration = duration;

  Task.store(String id, String title, String desc,
      TaskMode mode, bool isDone, int duration)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = mode,
        _isDone = isDone,
        _duration = duration;



  Map<String,dynamic> toMap() => {
    "id": this.id,
    "title": this.title,
    "desc": this.desc,
    "mode": this.mode.toJson(),
    "isDone": this.isDone,
    "duration": this.duration,
  };

  Task.fromMap(Map<dynamic, dynamic> map)
      : _id = map["id"],
        _title = map["title"],
        _desc = map["desc"],
        _mode = TaskMode.fromJson(map["mode"]),
        _isDone = map["isDone"],
        _duration = map["duration"];


  TaskMode get mode => _mode;
  String get id => _id;
  String get title => _title;
  String get desc => _desc;
  bool get isDone => _isDone;
  int get duration => _duration;
  set isDone(bool _in) => _isDone = _in;


  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.title} - ${this.desc}) now!");
    }
  }
}