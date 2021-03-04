class Item {
  String _id;
  String _title;
  String _description;
  bool _done;

  Item(String id, String title, String description) {
    _id = id;
    _title = title;
    _description = description;
    _done = false;
  }

  // A bunch of setter and getter functions
  get id => _id;
  String get title => _title;
  String get description => _description;
  bool get isDone => _done;
  set id(var _in) => _id = _in;
  set title(String _in) => _title = _in;
  set description(String _in) => _description = _in;
  set isDone(bool _in) => _done = _in;

  bool markDone() {
    _done = true;
    return true;
  }
}