class Task {
  String _id;
  String _title;
  String _desc;
  int _mode;
  String _projectName;
  String _createdDate;
  DateTime _deadline;
  bool _isDone;
  String _projectID;
  Task(String id, String title, String desc, int mode, String projectName, String projectID, String createdDate, DateTime deadline, bool isDone) : _id = id, _title = title, _desc = desc, _mode = mode, _projectName = projectName, _projectID = projectID, _createdDate = createdDate, _deadline = deadline, _isDone = isDone;


  Map<String,dynamic> toMap() => {
    "id": this.id,
    "title": this.title,
    "decs": this.desc,
    "mode": this.mode,
    "projectName": this.projectName,
    "projectID": this.projectID,
    "createdDate": this.createdDate,
    "deadline": this.deadline,
    "isDone": this.isDone,
  };

  Task.fromMap(Map<dynamic, dynamic> task)
      : _id = task["id"],
        _title = task["title"],
        _desc = task["desc"],
        _mode = task["mode"],
        _projectName = task["projectName"],
        _projectID = task["projectID"],
        _createdDate = task["createdDate"],
        _deadline = task["deadline"].toDate(),
        _isDone = task["isDone"];



  int get mode => _mode;
  String get createdDate => _createdDate;
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