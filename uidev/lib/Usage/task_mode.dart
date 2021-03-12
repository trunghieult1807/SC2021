class TaskMode {
  static List<String> _descList = [
    "Delete it!",
    "Delegate it",
    "Decide when to do it",
    "Do it now!"
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


  Map<String, dynamic> toJson() =>
      {
        'priority': _priority,
      };

  TaskMode.fromJson(Map parsedJson) {
    _priority = parsedJson['priority'];
  }

  void _setColorAndDesc() {
    _color = _colorList[_priority];
    _desc = _descList[_priority];
  }

  bool get important => _important;
  bool get urgent => _urgent;
  int get priority => _priority;
  String get color => _color;
  set priority(int _in) => _priority = _in;

  String getDescription(int priority){
    return _descList[priority];
  }
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