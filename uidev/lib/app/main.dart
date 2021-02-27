import 'package:uidev/app/Item.dart';
import 'package:uidev/app/Work.dart';
import 'package:uidev/app/KeyResult.dart';
import 'package:uidev/app/Task.dart';

void main() {
  Work my_project = Work("SC2021", "Complete this fucking app", new DateTime.now(), "A project to join Solution Challenge 2021");
  KeyResult kr1 = KeyResult("Create backend 1", new DateTime.now());
  KeyResult kr2 = KeyResult("Create backend 2", new DateTime.now());
  KeyResult kr3 = KeyResult("Create backend 3", new DateTime.now());
  my_project.addKeyResult(kr1);
  my_project.addKeyResult(kr2);
  my_project.addKeyResult(kr3);
  Task task1 = Task(1, "Do it");
  Task task2 = Task(0, "Fuck it");
  Task task3 = Task(2, "Build Work");
  Task task4 = Task(2, "Build Task");
  Task task5 = Task(3, "Do it now please");
  Task task6 = Task(1, "Do it later");
  kr1.addTask(task1);
  kr2.addTask(task2);
  kr2.addTask(task3);
  kr3.addTask(task4);
  kr3.addTask(task5);
  kr3.addTask(task6);

  task1.markDone();
  kr1.markDone();

  task1.description = "Change to something else";


  print(my_project);
  for (var i = 0; i < my_project.allKeyResult.length; i++) {
    print(my_project.allKeyResult[i]);
    for (var j = 0; j < my_project.allKeyResult[i].allTask.length; j++) {
      print(my_project.allKeyResult[i].allTask[j]);
    }
  }
}