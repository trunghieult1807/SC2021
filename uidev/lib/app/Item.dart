class Item {
  int _id;
  String _description;
  bool _done;
  DateTime _created_date;

  Item(String description) {
    _description = description;
    _done = false;
    _created_date = DateTime.now();
  }

  // A bunch of setter and getter functions
  int get id => _id;
  String get description => _description;
  bool get isDone => _done;
  DateTime get created_date => _created_date;
  set id(int _in) => _id = _in;
  set description(String _in) => _description = _in;

  bool markDone() {
    _done = true;
    return true;
  }
}