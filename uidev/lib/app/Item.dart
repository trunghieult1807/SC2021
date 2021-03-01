class Item {
  String _id;
  String _title;
  String _description;
  bool _done;
  DateTime _created_date;

  Item(String id, String title, String description) {
    _id = id;
    _title = title;
    _description = description;
    _done = false;
    _created_date = DateTime.now();
  }

  // A bunch of setter and getter functions
  get id => _id;
  String get title => _title;
  String get description => _description;
  bool get isDone => _done;
  DateTime get created_date => _created_date;
  set id(var _in) => _id = _in;
  set title(String _in) => _title = _in;
  set description(String _in) => _description = _in;

  bool markDone() {
    _done = true;
    return true;
  }
}