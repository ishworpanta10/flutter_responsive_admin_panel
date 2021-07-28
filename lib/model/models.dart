import 'package:flutter/material.dart';

class ButtonsInfo {
  ButtonsInfo({required this.title, required this.icon});

  String title;
  IconData icon;
}

class Task {
  Task({required this.task, required this.taskValue, required this.color});

  String task;
  double taskValue;
  Color color;
}
