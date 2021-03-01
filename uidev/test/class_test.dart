// // import 'package:test/test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:uidev/app/Item.dart';
// import 'package:uidev/app/Work.dart';
// import 'package:uidev/app/Project.dart';
// import 'package:uidev/app/Task.dart';
// import 'package:uidev/app/TaskList.dart';
// import 'package:uidev/app/Timeline.dart';
//
// void main() {
//   Work project = new Work("SC2021", "Complete the app and win the contest",
//                           DateTime(2021,3,31),
//                           "App keeps track user's working progress using OKR system");
//   Project kr1 = new Project("Interview 15 people to get an overview of problem",
//                                 DateTime(2021, 2, 5));
//   Project kr2 = new Project("Sketch the app UI and create prototype", DateTime(2021, 2, 15));
//   Project kr3 = new Project("Complete the app and answer the Google's questions",
//                                 DateTime(2021, 3, 31));
//   Task task1 = new Task.setPriority(2, "List all potential user personas");
//   Task task2 = new Task.setPriority(1, "Meet interviewees suitable with the listed personas");
//   Task task3 = new Task.setPriority(3, "Meeting with team to design the raw UI of the app");
//   Task task4 = new Task.setPriority(2, "Using MarvelApp/Figma to prototype the UI");
//   Task task5 = new Task.setPriority(1, "Test the prototype with potential interviewees");
//   Task task6 = new Task.setPriority(1, "Design Class Entities for backend");
//   Task task7 = new Task.setPriority(2, "Answer Google's questions and analyze what missed or achieved");
//   group("Work", () {
//     test("Work created is not Done yet", () {
//       expect(project.isDone, false);
//     });
//     test("Work without KR can be marked as Done", () {
//       project.markDone();
//       expect(project.isDone, true);
//     });
//     test("Not allow to add Key Result with later deadline to Work", () {
//       Project late_kr = new Project("A useless Key Result", DateTime(2021, 5, 1));
//       project.addKeyResult(late_kr);
//       expect(project.allKeyResult.length, 0);
//     });
//     test("Test addKeyResult()", () {
//       project.addKeyResult(kr1);
//       expect(project.allKeyResult.length, 1);
//     });
//     test("Test addManyKeyResults", () {
//       project.addManyKeyResults([kr2, kr3]);
//       expect(project.allKeyResult.length, 3);
//     });
//   });
//   group("Task", () {
//     test("Mark Important flag if not yet important", () {
//       task2.mode.markImportant();
//       expect(task2.mode.color, "blue");
//       expect(task2.mode.important, true);
//     });
//     test("Mark Important flag is ignored if already important", () {
//       task2.mode.markImportant();
//       expect(task2.mode.color, "blue");
//       expect(task2.mode.important, true);
//     });
//     test("Unmark Important flag successfully", () {
//       task2.mode.unmarkImportant();
//       expect(task2.mode.color, "yellow");
//       expect(task2.mode.important, false);
//       expect(task2.mode.urgent, true);
//     });
//   });
//   group("TaskList", () {
//     TaskList taskList = new TaskList(DateTime(2021, 3, 31));
//     test("Add task to task list", () {
//       taskList.addTask(task1);
//       taskList.addTask(task2);
//       expect(taskList.allTask.length, 2);
//     });
//     test("Add task already in task list", () {
//       taskList.addTask(task2);
//       expect(taskList.allTask.length, 2);
//     });
//     test("Notify task list", () {
//       taskList.addTask(task4);
//       var timeline = taskList.generateTimeline();
//       timeline.notify();
//       expect(timeline.phase1_tasks.length, 0);
//       expect(timeline.phase2_tasks.length, 2);
//       expect(timeline.phase3_tasks.length, 1);
//       expect(timeline.extra_tasks.length, 0);
//     });
//   });
// }
