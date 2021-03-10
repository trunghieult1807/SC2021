import 'package:flutter_test/flutter_test.dart';
import 'package:uidev/Usage/utility.dart';
import 'dart:io';

void main() {
  test("Display years left", () {
    DateTime start = DateTime(2019, 2, 14, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "2 years left");
  });
  test("Display 1 year left", () {
    DateTime start = DateTime(2020, 2, 14, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "1 year left");
  });
  test("Display days left", () {
    DateTime start = DateTime(2021, 2, 14, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "29 days left");
  });
  test("Display 1 day left", () {
    DateTime start = DateTime(2021, 3, 14, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "1 day left");
  });
  test("Display hours left", () {
    DateTime start = DateTime(2021, 3, 15, 8, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "3 hours left");
  });
  test("Display 1 hour left", () {
    DateTime start = DateTime(2021, 3, 15, 10, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "1 hour left");
  });
  test("Display minutes left", () {
    DateTime start = DateTime(2021, 3, 15, 11, 5, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "6 minutes left");
  });
  test("Display 1 minute left", () {
    DateTime start = DateTime(2021, 3, 15, 11, 10, 9);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "1 minute left");
  });
  test("Display seconds left", () {
    DateTime start = DateTime(2021, 3, 15, 11, 11, 9);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "2 seconds left");
  });
  test("Display 1 second left", () {
    DateTime start = DateTime(2021, 3, 15, 11, 11, 10);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "1 second left");
  });
  test("Display 0 second left", () {
    DateTime start = DateTime(2021, 3, 15, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "0 second left");
  });
  test("Illusion timeline universe", () {
    DateTime start = DateTime(2023, 3, 15, 11, 11, 11);
    DateTime end = DateTime(2021, 3, 15, 11, 11, 11);
    expect(displayTimeLeft(start, end), "Over due");
  });
}