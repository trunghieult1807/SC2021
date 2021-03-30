import 'package:sc2021/Usage/task_mode.dart';
import 'package:sc2021/Usage/task_timer.dart';

class Task {
  String _id;
  String _title;
  String _desc;
  TaskMode _mode;
  bool _isDone;
  int _duration;
  int _expectTime;
  double _weight;
  DateTime _start;
  bool _tracking;

  Task(String id, String title, String desc,
      int mode, DateTime start, bool tracking)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _isDone = false,
        _start = start,
        _tracking = tracking;



  Task.retrieve(String id, String title, String desc,
       int mode, bool isDone, int duration, DateTime start, bool tracking)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _isDone = isDone,
        _duration = duration,
        _start = start,
        _tracking = tracking;

  Task.store(String id, String title, String desc,
      TaskMode mode, bool isDone, int duration, DateTime start, bool tracking)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = mode,
        _isDone = isDone,
        _duration = duration,
        _start = start,
        _tracking = tracking;



  Map<String,dynamic> toMap() => {
    "id": this.id,
    "title": this.title,
    "desc": this.desc,
    "mode": this.mode.toJson(),
    "isDone": this.isDone,
    "duration": this.duration,
    "start": this._start,
    "tracking": this._tracking,
  };

  Task.fromMap(Map<dynamic, dynamic> map)
      : _id = map["id"],
        _title = map["title"],
        _desc = map["desc"],
        _mode = TaskMode.fromJson(map["mode"]),
        _isDone = map["isDone"],
        _duration = map["duration"],
        _start = map["start"] == null ? null: map["start"].toDate(),
        _tracking = map["tracking"];


  TaskMode get mode => _mode;
  String get id => _id;
  String get title => _title;
  String get desc => _desc;
  bool get isDone => _isDone;
  bool get tracking => _tracking;
  DateTime get start => _start;
  int get duration => _duration;
  int get expectTime => _expectTime;
  double get weight => _weight;
  set isDone(bool _in) => _isDone = _in;
  set weight(double _in) => _weight = _in;
  set tracking(bool _in) => _tracking = _in;
  set start(DateTime _in) => _start = _in;

  set expectTime(int _in) => _expectTime = _in;

  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.title} - ${this.desc}) now!");
    }
  }
}