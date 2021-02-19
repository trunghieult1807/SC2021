class Item {
  static int _idCount = 0;
  int _id;
  String _description;
  bool _done;

  Item(String description) {
    _id = _idCount++;
    _description = description;
    _done = false;
  }

  // A bunch of setter and getter functions
  int get id => _id;
  String get description => _description;
  bool get isDone => _done;
  set description(String _in) => _description = _in;

  bool markDone() {
    _done = true;
    return true;
  }
}