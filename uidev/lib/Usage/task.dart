import 'package:uidev/Usage/task_mode.dart';

class Task {
  String _id;
  String _title;
  String _desc;
  TaskMode _mode;
  String _projectName;
  DateTime _createdDate;
  DateTime _deadline;
  bool _isDone;
  String _projectID;


  Task(String id, String title, String desc,
      int mode, String projectName, String projectID,
      DateTime createdDate, DateTime deadline)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _projectName = projectName,
        _projectID = projectID,
        _createdDate = createdDate,
        _deadline = deadline,
        _isDone = false;

  Task.retrieve(String id, String title, String desc,
       int mode, String projectName, String projectID,
       DateTime createdDate, DateTime deadline, bool isDone)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = TaskMode.setPriority(mode),
        _projectName = projectName,
        _projectID = projectID,
        _createdDate = createdDate,
        _deadline = deadline,
        _isDone = isDone;

  Task.store(String id, String title, String desc,
      TaskMode mode, String projectName, String projectID,
      DateTime createdDate, DateTime deadline, bool isDone)
      : _id = id,
        _title = title,
        _desc = desc,
        _mode = mode,
        _projectName = projectName,
        _projectID = projectID,
        _createdDate = createdDate,
        _deadline = deadline,
        _isDone = isDone;



  Map<String,dynamic> toMap() => {
    "id": this.id,
    "title": this.title,
    "decs": this.desc,
    "mode": this.mode.toJson(),
    "projectName": this.projectName,
    "projectID": this.projectID,
    "createdDate": this.createdDate,
    "deadline": this.deadline,
    "isDone": this.isDone,
  };

  Task.fromMap(Map<dynamic, dynamic> map)
      : _id = map["id"],
        _title = map["title"],
        _desc = map["desc"],
        _mode = TaskMode.fromJson(map["mode"]),
        _projectName = map["projectName"],
        _projectID = map["projectID"],
        _createdDate = map["createdDate"].toDate(),
        _deadline = map["deadline"].toDate(),
        _isDone = map["isDone"];


  TaskMode get mode => _mode;
  DateTime get createdDate => _createdDate;
  String get id => _id;
  String get title => _title;
  String get desc => _desc;
  String get projectName => _projectName;
  String get projectID => _projectID;
  DateTime get deadline => _deadline;
  set deadline(DateTime _in) => _deadline = _in;
  bool get isDone => _isDone;
  set isDone(bool _in) => _isDone = _in;


  void notify() {
    if (!this.isDone) {
      print("You should do Task #${this.id} (${this.title} - ${this.desc}) now!");
    }
  }
}