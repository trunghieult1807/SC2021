import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';
import 'package:sc2021/global_variable.dart';
import 'package:sc2021/global_variable.dart';

final User user = FirebaseAuth.instance.currentUser;
final FirebaseFirestore db = FirebaseFirestore.instance;
/* Global declare variable*/
Duration workingTimePerDay = new Duration(hours: 8);
/************************* */

String displayTimeLeft(DateTime start, DateTime end) {
  if (start.isAfter(end)) {
    return "Over due";
  }

  Duration timeLeft = end.difference(start);

  int time = 0;
  String unit = "second";
  if (timeLeft.inDays > 0) {
    if (timeLeft.inDays ~/ 365 > 0) {
      time = timeLeft.inDays ~/ 365;
      unit = timeLeft.inDays ~/ 365 == 1 ? "year" : "years";
    } else {
      time = timeLeft.inDays;
      unit = timeLeft.inDays == 1 ? "day" : "days";
    }
  } else if (timeLeft.inHours > 0) {
    time = timeLeft.inHours;
    unit = timeLeft.inHours == 1 ? "hour" : "hours";
  } else if (timeLeft.inMinutes > 0) {
    time = timeLeft.inMinutes;
    unit = timeLeft.inMinutes == 1 ? "minute" : "minutes";
  } else if (timeLeft.inSeconds > 0) {
    time = timeLeft.inSeconds;
    unit = timeLeft.inSeconds == 1 ? "second" : "seconds";
  }

  return "${time} ${unit} left";
}

List<Color> getColor(int priority) {
  if (priority == 0) {
    return [LightColors.gGreen, LightColors.gGreen2];
  } else if (priority == 1) {
    return [LightColors.gBlue, LightColors.gBlue2];
  } else if (priority == 2) {
    return [LightColors.gOrange, LightColors.gOrange2];
  } else
    return [LightColors.gRed, LightColors.gRed];
}

Color getColor2(int priority) {
  if (priority == 0) {
    return LightColors.gGreen2;
  } else if (priority == 1) {
    return LightColors.gBlue2;
  } else if (priority == 2) {
    return LightColors.gOrange2;
  } else
    return LightColors.gRed2;
}

void getAllTaskListBegin() {
  // await Firebase.initializeApp();
  List<TaskList> taskList = [];
  db
      .collection("users")
      .doc(user.uid)
      .collection("taskList")
      .snapshots()
      .forEach((element) {
    element.docs.forEach((doc) {
      taskList.add(
        TaskList(
          doc.data()["id"],
          doc.data()["title"],
          doc.data()["desc"],
          doc.data()['tasks'].map<Task>((item) {
            return Task.fromMap(item);
          }).toList(),
          doc.data()["createdDate"].toDate(),
          doc.data()["deadline"].toDate(),
          Color(
            int.parse(doc.data()["color"].split('(0x')[1].split(')')[0],
                radix: 16),
          ),
        ),
      );
    });
  });
  Future.delayed(Duration(milliseconds: 1500), () {
    GlobalVariable.allTaskListBegin = taskList;
  });
}

void getAllTaskListEnd() {
  // await Firebase.initializeApp();
  List<TaskList> taskList = [];
  db
      .collection("users")
      .doc(user.uid)
      .collection("taskList")
      .snapshots()
      .forEach((element) {
    element.docs.forEach((doc) {
      taskList.add(
        TaskList(
          doc.data()["id"],
          doc.data()["title"],
          doc.data()["desc"],
          doc.data()['tasks'].map<Task>((item) {
            return Task.fromMap(item);
          }).toList(),
          doc.data()["createdDate"].toDate(),
          doc.data()["deadline"].toDate(),
          Color(
            int.parse(doc.data()["color"].split('(0x')[1].split(')')[0],
                radix: 16),
          ),
        ),
      );
    });
  });
  Future.delayed(Duration(milliseconds: 1500), () {
    GlobalVariable.allTaskListEnd = taskList;
  });
}
// Get expected working time of all to do task in date d
void expectWorkingTime(DateTime d, List<TaskList> allTaskLists) {
  // Get all task list of that user

  // Get all To do tasks in the day and totalLoadFactor
  List<Task> todoTasks = [];
  double totalWeight = 0;
  List<int> expectTime = [];
  allTaskLists.forEach((tasklist) {
    // Update weight of tasks in that Date
    tasklist.updateTaskWeight(tasklist.getLoadFactor(d));

    List<Task> tasks = tasklist.getToDoTasks(d);
    GlobalVariable.todayTasksBegin = tasks;
    tasks.forEach((task) {
      todoTasks.add(task);
      totalWeight += task.weight;
    });
  });

  todoTasks.forEach((task) {
    task.expectTime =
        (workingTimePerDay.inMinutes * task.weight / totalWeight).round();
    // expectTime.add((workingTimePerDay.inMinutes * task.weight / totalWeight).round());

  });
}
void getTodoTaskEnd(List<TaskList> allTaskLists, List<String> idList) {
  // Get all task list of that user

  // Get all To do tasks in the day and totalLoadFactor
  List<Task> todoTasks = [];
  allTaskLists.forEach((tasklist) {
    List<Task> tasks = tasklist.getTaskByID(idList);
    todoTasks.addAll(tasks);
  });
  GlobalVariable.todayTasksEnd = todoTasks;
}

// Compute working efficiency in a day
double computeWorkingEfficiency(List<Task> tasksToComputeBegin, List<Task> tasksToComputeEnd) {
  double efficiency = 0;
  double efficiency2 = 0;
  for (int i = 0; i < tasksToComputeBegin.length; i +=1) {
    for (int j = 0; j < tasksToComputeBegin.length; j +=1) {
      if (tasksToComputeBegin[i].id == tasksToComputeEnd[j].id) {
        efficiency += (tasksToComputeEnd[j].duration - tasksToComputeBegin[i].expectTime) * tasksToComputeBegin[i].weight;
        efficiency2 += (tasksToComputeEnd[j].duration - tasksToComputeBegin[i].expectTime).abs() * tasksToComputeBegin[i].weight;
      }
    }
  }
  // tasksToCompute.forEach((task) {
  //   if (task.duration > 0) {
  //     efficiency += (task.duration - task.expectTime) * task.weight;
  //     efficiency2 += (task.duration - task.expectTime).abs() * task.weight;
  //   }
  // });
  if (efficiency2 == 0) {
    return 1;
  }

  // @TODO: Store efficiency per day for each user
  // **YOUR CODE HERE**

  return efficiency/efficiency2;
}
