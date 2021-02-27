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

class Task extends Item {
  static int _idCount = 1;
  TaskMode _mode;

  Task(String desc) : _mode = new TaskMode(), super(desc) {
    this.id = _idCount++;
    print("Task #${this.id}: Created Successfully!");
  }
  Task.setPriority(int level, String desc) : _mode = new TaskMode.setPriority(level), super(desc) {
    this.id = _idCount++;
    print("Task #${this.id}: Created Successfully!");
  }

  String toString() {
    return "Task #${this.id}: ${this.description} - ${this.isDone ? "Done" : "In progress"}";
  }

  TaskMode get mode => _mode;

  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.description}) now!");
    }
  }
}