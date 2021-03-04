import 'package:uidev/app/Item.dart';

class TaskMode {
  static List<String> _descList = [
    "Not important, not urgent. Delete it!",
    "Urgent, not important. Delegate it",
    "Important, not urgent. Decide when to do it",
    "Urgent & important. Do it now!"
  ];
  static List<String> _colorList = ["green", "yellow", "red", "blue"];
  int _priority;
  bool _important;
  bool _urgent;
  String _color;
  String _desc;

  TaskMode() {
    _important = false;
    _urgent = false;
    _priority = 0;
    this._setColorAndDesc();
  }
  TaskMode.setPriority(int pr) {
    _priority = pr;
    switch (pr) {
      case 0: {
        _important = false;
        _urgent = false;
      }
      break;
      case 1: {
        _important = false;
        _urgent = true;
      }
      break;
      case 2: {
        _important = true;
        _urgent = false;
      }
      break;
      case 3: {
        _important = true;
        _urgent = true;
      }
      break;
      default: {
        print("What the fuck is this mode!!!");
      }
      break;
    }
    this._setColorAndDesc();
  }
  void _setColorAndDesc() {
    _color = _colorList[_priority];
    _desc = _descList[_priority];
  }

  bool get important => _important;
  bool get urgent => _urgent;
  int get priority => _priority;
  String get description => _desc;
  String get color => _color;

  void markImportant() {
    if (!_important) {
      _important = true;
      _priority += 2;
      this._setColorAndDesc();
    }
  }
  void unmarkImportant() {
    if (_important) {
      _important = false;
      _priority -= 2;
      this._setColorAndDesc();
    }
  }
  void markUrgent() {
    if (!_urgent) {
      _urgent = true;
      _priority += 1;
      this._setColorAndDesc();
    }
  }
  void unmarkUrgent() {
    if (_urgent) {
      _urgent = false;
      _priority -= 1;
      this._setColorAndDesc();
    }
  }
}

class TaskTimer {
  static int _idCount = 1;
  int _id;
  bool _isActive;
  DateTime _start;
  DateTime _end;
  List<Duration> _durationList = [];

  TaskTimer() {
    _id = _idCount++;
    _isActive = false;
  }
  int get id => _id;
  List<Duration> get durationList => _durationList;
  set id(int _in) => _id = _in;

  void start() {
    if (!_isActive) {
      _isActive = true;
      _start = DateTime.now();
    }
  }
  void stop() {
    if (_isActive) {
      _isActive = false;
      _end = DateTime.now();
      _durationList.add(_end.difference(_start));
    }
  }
  bool isActive() {
    return _isActive;
  }
  Duration getDuration() {
    return _durationList.fold(Duration.zero, (acc, ele) => acc + ele);
  }
}

class Task extends Item {
  static int _idCount = 1;
  TaskMode _mode;
  TaskTimer _timer;
  List<Duration> _duration = [];

  Task(String desc) : _mode = new TaskMode(), super(desc) {
    this.id = _idCount++;
    _timer = TaskTimer();
    print("Task #${this.id}: Created Successfully!");
  }
  Task.setPriority(int level, String desc) : _mode = new TaskMode.setPriority(level), super(desc) {
    this.id = _idCount++;
    _timer = TaskTimer();
    print("Task #${this.id}: Created Successfully!");
  }

  String toString() {
    return "Task #${this.id}: ${this.description} - ${this.isDone ? "Done" : "In progress"}";
  }

  TaskMode get mode => _mode;
  TaskTimer get timer => _timer;

  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.description}) now!");
    }
  }
  void startTimer() {
    if (!this.isDone) {
      _timer.start();
    }
  }
  void stopTimer() {
    if (!this.isDone) {
      _timer.stop();
    }
  }
  void resetTimer() {
    _timer = new TaskTimer();
  }
  @override
  bool markDone() {
    if (_timer.isActive()) {
      _timer.stop();
    }
    return super.markDone();
  }
  Duration getDuration() {
    return _timer.getDuration();
  }
}