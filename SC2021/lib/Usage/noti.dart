import 'package:uidev/Usage/task_mode.dart';
import 'package:uidev/Usage/task_timer.dart';

class Noti {
  int _notiMode;
  String _title;
  String _subtitle;
  DateTime _createdDate;

  Noti(int notiMode, String title, String subtitle,
      DateTime createdDate)
      : _notiMode = notiMode,
        _title = title,
        _subtitle = subtitle,
        _createdDate = createdDate;

  int get notiMode => _notiMode;
  String get title => _title;
  String get subtitle => _subtitle;
  DateTime get createdDate => _createdDate;


}