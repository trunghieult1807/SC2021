import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/app/Item.dart';

class TaskMode {
  static List<String> _descList = [
    "Not important, not urgent. Delete it!",
    "Urgent, not important. Delegate it",
    "Important, not urgent. Decide when to do it",
    "Urgent & important. Do it now!"
  ];
  static List<Color> _colorList = [LightColors.kDarkYellow, LightColors.kBlue, LightColors.kRed, LightColors.kGreen];
  int _priority;
  bool _important;
  bool _urgent;
  Color _color;
  String _desc;

  TaskMode() {
    _important = false;
    _urgent = false;
    _priority = 0;
    this._setColorAndDesc();
  }
  // TaskMode.setPriority(int pr) {
  //   _priority = pr;
  //   switch (pr) {
  //     case 0: {
  //       _important = false;
  //       _urgent = false;
  //     }
  //     break;
  //     case 1: {
  //       _important = false;
  //       _urgent = true;
  //     }
  //     break;
  //     case 2: {
  //       _important = true;
  //       _urgent = false;
  //     }
  //     break;
  //     case 3: {
  //       _important = true;
  //       _urgent = true;
  //     }
  //     break;
  //     default: {
  //       print("What the fuck is this mode!!!");
  //     }
  //     break;
  //   }
  //   this._setColorAndDesc();
  // }
  void _setColorAndDesc() {
    _color = _colorList[_priority];
    _desc = _descList[_priority];
  }

  bool get important => _important;
  bool get urgent => _urgent;
  String get description => _desc;
  Color get color => _color;

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
  TaskMode _mode;
  String _projectName;

  Task(String id, String title, String desc, String projectName) : _mode = new TaskMode(), _projectName = projectName, super(id, title, desc) {
    print("Task #${this.id}: Created Successfully!");
  }
  // Task.setPriority(int level, String id, String title, String desc) : _mode = new TaskMode.setPriority(level), super(id, title, desc) {
  //   print("Task #${this.id}: Created Successfully!");
  // }

  String toString() {
    return "Task #${this.id}: ${this.title} - ${this.description} - ${this.isDone ? "Done" : "In progress"}";
  }

  TaskMode get mode => _mode;
  String get projectName => _projectName;

  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.title} - ${this.description}) now!");
    }
  }
}