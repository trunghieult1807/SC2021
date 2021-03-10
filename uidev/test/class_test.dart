import 'package:flutter_test/flutter_test.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/time_line.dart';
import 'package:uidev/Usage/task_timer.dart';
import 'package:uidev/Usage/task_mode.dart';
import 'dart:io';

void main() {
  DateTime deadline = DateTime(2021, 3, 31);
  DateTime createdDate = DateTime(2021, 2, 25);
  Task task1 = new Task('1', "a", "b", 2, "c", "a", createdDate, deadline);
  Task task2 = new Task('2', "a", "b", 1, "c", "a", createdDate, deadline);
  Task task3 = new Task('3', "a", "b", 3, "c", "a", createdDate, deadline);
  Task task4 = new Task('4', "a", "b", 2, "c", "a", createdDate, deadline);
  Task task5 = new Task('5', "a", "b", 1, "c", "a", createdDate, deadline);
  Task task6 = new Task('6', "a", "b", 0, "c", "a", createdDate, deadline);
  Task task7 = new Task('7', "a", "b", 2, "c", "a", createdDate, deadline);
  List<Task> taskLst = [task1, task2, task3, task4, task5, task6, task7];
  TaskList taskList = new TaskList('1', 'a', 'b', taskLst, createdDate, deadline, null);
  group("Task", () {
    test("Mark Important flag if not yet important", () {
      task2.mode.markImportant();
      expect(task2.mode.color, "blue");
      expect(task2.mode.important, true);
    });
    test("Mark Important flag is ignored if already important", () {
      task2.mode.markImportant();
      expect(task2.mode.color, "blue");
      expect(task2.mode.important, true);
    });
    test("Unmark Important flag successfully", () {
      task2.mode.unmarkImportant();
      expect(task2.mode.color, "yellow");
      expect(task2.mode.important, false);
      expect(task2.mode.urgent, true);
    });
  });
  // group("TaskTimer", () {
  //   Task task = new Task('1', "a", "b", 2, "c", "a", createdDate, deadline);
  //   test("Start task timer first time", () {
  //     task.startTimer();
  //     sleep(Duration(seconds:1));
  //     expect(task.timer.isActive(), true);
  //   });
  //   test("Cannot get duration yet", () {
  //     expect(task.timer.durationList.length, 0);
  //     expect(task.getDuration(), Duration.zero);
  //   });
  //   test("Stop task timer second time", () {
  //     task.stopTimer();
  //     expect(task.timer.isActive(), false);
  //   });
  //   test("Get timer duration", () {
  //     expect(task.timer.durationList.length, 1);
  //   });
  //   test("Start and stop timer many time", () {
  //     task.startTimer();
  //     sleep(Duration(seconds:1));
  //     task.startTimer();
  //     sleep(Duration(seconds:1));
  //     task.stopTimer();
  //     task.startTimer();
  //     sleep(Duration(seconds:2));
  //     task.stopTimer();
  //     task.stopTimer();
  //     expect(task.timer.durationList.length, 3);
  //   });
  //   test("Mark done task will end timer", () {
  //     task.startTimer();
  //     sleep(Duration(seconds:1));
  //     task.markDone();

  //     // Cannot activate timer again
  //     task.startTimer();
  //     sleep(Duration(seconds:1));
  //     task.stopTimer();

  //     expect(task.timer.durationList.length, 4);
  //   });
  //   test("Get total duration", () {
  //     expect(task.getDuration().inSeconds, 6);
  //   });
  // });
  group("TaskList", () {
    test("Get Important and Urgent tasks", () {
      expect(taskList.getImportantUrgentTasks().length, 1);
    });
    test("Get Important tasks", () {
      expect(taskList.getImportantTasks().length, 3);
    });
    test("Get Urgent tasks", () {
      expect(taskList.getUrgentTasks().length, 2);
    });
    test("Get not Important nor Urgent tasks", () {
      expect(taskList.getExtraTasks().length, 1);
    });
    test("Get to-do list at the time created", () {
      expect(taskList.getToDoTasks(createdDate).length, 1);
    });
    test("Get to-do list after Done all phase 1 tasks", () {
      task3.isDone = true;    // Mark the task as Done
      expect(taskList.getToDoTasks(createdDate).length, 3);
      task3.isDone = false;   // Reset to keep pure environment
    });
    test("Get to-do list 2", () {
      task3.isDone = true;
      task1.isDone = true;
      expect(taskList.getToDoTasks(createdDate).length, 2);
      task3.isDone = false;
      task1.isDone = false;
    });
    test("Get to-do list 3", () {
      DateTime testDate = createdDate.add(deadline.difference(createdDate) ~/ 3 + Duration(hours:1));
      expect(taskList.getToDoTasks(testDate).length, 4);
    });
    test("Get progress percent", () {
      expect(taskList.getProgressPercent(), 0);
    });
    test("Get progress percent 2", () {
      task1.isDone = true;
      expect(taskList.getProgressPercent(), 2/11 * 100);
      task1.isDone = false;
    });
  });
}
