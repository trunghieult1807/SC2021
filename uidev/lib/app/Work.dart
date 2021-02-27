import 'package:uidev/app/Item.dart';
import 'package:uidev/app/KeyResult.dart';

class Work extends Item {
  static int _idCount = 1;
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
    this.id = _idCount++;
    print("Work #${this.id}: Created Successfully!");
  }

  String toString() {
    return "Work ${this.id}: $_name, $_objective, $_deadline - ${this.isDone ? "Done" : "In progress"}";
  }

  // A bunch of setter and getter functions
  String get name => _name;
  String get objective => _objective;
  DateTime get deadline => _deadline;
  List<KeyResult> get allKeyResult => _krList;
  set name(String _in) => _name = _in;
  set objective(String _in) => _objective = _in;
  set deadline(DateTime _in) => _deadline = _in;

  // Add KeyResult object to KRList of Work
  void addKeyResult(KeyResult kr) {
    if (_krList.contains(kr)) {
      print("KeyResult #${kr.id} already in Work #${this.id}");
    }
    else if (kr.deadline.compareTo(_deadline) <= 0) {
      _krList.add(kr);
      print("Work #${this.id}: Add Key Result #${kr.id} successfully");
    }
  }
  // Add many KeyResult objects simultaneously
  void addManyKeyResults(List<KeyResult> kr_list) {
    kr_list.forEach((kr) => this.addKeyResult(kr));
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