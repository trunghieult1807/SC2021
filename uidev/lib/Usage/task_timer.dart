class TaskTimer {
  static int _idCount = 1;
  int _id;
  bool _isActive;
  DateTime _start;
  DateTime _end;
  List<Duration> _durationList = [];

  TaskTimer() {
    _id = _idCount++;
    _isActive = false;
  }
  int get id => _id;
  List<Duration> get durationList => _durationList;
  set id(int _in) => _id = _in;

  void start() {
    if (!_isActive) {
      _isActive = true;
      _start = DateTime.now();
    }
  }
  void stop() {
    if (_isActive) {
      _isActive = false;
      _end = DateTime.now();
      _durationList.add(_end.difference(_start));
    }
  }
  bool isActive() {
    return _isActive;
  }
  Duration getDuration() {
    return _durationList.fold(Duration.zero, (acc, ele) => acc + ele);
  }
}