import 'package:uidev/app/Item.dart';

class TaskMode {
  static List<String> _descList = [
    "Not important, not urgent. Delete it!",
    "Urgent, not important. Delegate it",
    "Import, not urgent. Decide when to do it",
    "Urgent & important. Do it now!"
  ];
  static List<String> _colorList = ["green", "yellow", "red", "blue"];
  int _level;
  String _color;
  String _description;

  TaskMode(int level) {
    if (level < 4 && level > 0) {
      _color = _colorList[level];
      _description = _descList[level];
      _level = level;
    }
    else {
      print("What the fuck is this mode!!!!!!!!!!!");
    }
  }
  String get description => _description;
  String get color => _color;
  int get level => _level;
  set changeMode(int _in) {
    _level = _in;
    _color = _colorList[_in];
    _description = _descList[_in];
  }
}

class Task extends Item{
  TaskMode _mode;

  Task(int level, String desc) : _mode = new TaskMode(level), super(desc) {
    print("Task created!");
  }

  TaskMode get taskMode => _mode;
  set mode(int level) => _mode.changeMode = level;
}