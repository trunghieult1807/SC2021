import 'package:uidev/Usage/task.dart';

class Timeline {
  DateTime _phase1;
  DateTime _phase2;
  DateTime _deadline;
  bool _phase1_notifier = false;
  bool _phase2_notifier = false;
  bool _phase3_notifier = false;
  List<Task> _phase1_tasks = [];
  List<Task> _phase2_tasks = [];
  List<Task> _phase3_tasks = [];
  List<Task> _extra_tasks = [];
  List<DateTime> _notificationScheduler = [];

  Timeline(DateTime deadline) {
    Duration duration = deadline.difference(DateTime.now());
    Duration phaseDuration = duration ~/ 3;
    _phase1 = DateTime.now().add(phaseDuration);
    _phase2 = _phase1.add(phaseDuration);
    _deadline = deadline;

    // Set notifier
    this._setNotifier();
  }
  Timeline.load(DateTime phase1, DateTime phase2, DateTime deadline) {
    _phase1 = phase1;
    _phase2 = phase2;
    _deadline = deadline;

    // Set notifier
    this._setNotifier();
  }
  DateTime get phase1 => _phase1;
  DateTime get phase2 => _phase2;
  DateTime get deadline => _deadline;
  bool get phase1_notifier => _phase1_notifier;
  bool get phase2_notifier => _phase2_notifier;
  bool get phase3_notifier => _phase3_notifier;
  List<Task> get phase1_tasks => _phase1_tasks;
  List<Task> get phase2_tasks => _phase2_tasks;
  List<Task> get phase3_tasks => _phase3_tasks;
  List<Task> get extra_tasks => _extra_tasks;

  void _setNotifier() {
    if (DateTime.now().compareTo(_phase1) < 0) {
      _phase1_notifier = true;
      _phase2_notifier = false;
      _phase3_notifier = false;
    }
    else if (DateTime.now().compareTo(_phase2) < 0) {
      _phase1_notifier = true;
      _phase2_notifier = true;
      _phase3_notifier = false;
    }
    else if (DateTime.now().compareTo(_deadline) <= 0) {
      _phase1_notifier = true;
      _phase2_notifier = true;
      _phase3_notifier = true;
    }
  }

  void addPhase1Task(Task task) {
    _phase1_tasks.add(task);
  }
  void addPhase2Task(Task task) {
    _phase2_tasks.add(task);
  }
  void addPhase3Task(Task task) {
    _phase3_tasks.add(task);
  }
  void addExtraTask(Task task) {
    _extra_tasks.add(task);
  }

  void notify() {
    if (_phase1_notifier) {
      _phase1_tasks.forEach((task) => task.notify());
    }
    if (_phase1_tasks.length == 0 || _phase2_notifier) {
      _phase2_tasks.forEach((task) => task.notify());
    }
    if ((_phase1_tasks.length + _phase2_tasks.length == 0) || _phase3_notifier) {
      _phase3_tasks.forEach((task) => task.notify());
    }
  }
}