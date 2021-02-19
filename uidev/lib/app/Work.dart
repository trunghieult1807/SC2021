import 'package:uidev/app/Item.dart';
import 'package:uidev/app/KeyResult.dart';

class Work extends Item {
  String _name;
  String _objective;
  DateTime _deadline;
  List<KeyResult> _krList = [];

  Work(String name, String objective, DateTime deadline, String desc) :
    _name = name,
    _objective = objective,
    _deadline = deadline,
    super(desc)
  {
    print("Work created!");
  }

  // A bunch of setter and getter functions
  String get name => _name;
  String get objective => _objective;
  DateTime get deadline => _deadline;
  List<KeyResult> get allKeyResult => _krList;
  set name(String _in) => _name = _in;
  set objective(String _in) => _objective = _in;
  set deadline(DateTime _in) => _deadline = _in;

  void addKeyResult(KeyResult kr) {
    _krList.add(kr);
  }
  KeyResult removeKeyResult(int krId) {
    for (var i = 0; i < _krList.length; i++) {
      if (krId == _krList[i].id) {
        return _krList.removeAt(i);
      }
    }
    return null;
  }
  @override
  bool markDone() {
    if (this.isDone) return true;
    for (var i = 0; i < _krList.length; i++) {
      if (!_krList[i].isDone) return false;
    }
    super.markDone();
    return true;
  }
}