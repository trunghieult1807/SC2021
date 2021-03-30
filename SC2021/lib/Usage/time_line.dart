import 'package:sc2021/Usage/task.dart';

class Timeline {
  DateTime _phase1;
  DateTime _phase2;
  DateTime _deadline;

  Timeline(DateTime startDate, DateTime deadline) {
    // Create new Timeline object
    Duration duration = deadline.difference(startDate);
    Duration phaseDuration = duration ~/ 3;
    _phase1 = startDate.add(phaseDuration);
    _phase2 = _phase1.add(phaseDuration);
    _deadline = deadline;
  }
  Timeline.load(DateTime phase1, DateTime phase2, DateTime deadline) {
    // Load from Database to create Timeline object
    _phase1 = phase1;
    _phase2 = phase2;
    _deadline = deadline;
  }
  DateTime get phase1 => _phase1;
  DateTime get phase2 => _phase2;
  DateTime get deadline => _deadline;
}