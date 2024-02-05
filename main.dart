import 'package:flutter/material.dart';
import 'package:student_tracker_scratch/AssignmentTrack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: AssignmentTrack(title: 'Assignment Tracker'),
    );
  }
}

class Assignment {
  final String title;
  final String subject;
  bool isDone;

  Assignment({required this.title,required this.subject, this.isDone = false});
}

List<Assignment> assignments = [];
const List<Icon> list = <Icon>[
  Icon(
  Icons.class_
  ),
  Icon(
  Icons.edit_calendar
  ),
  Icon(
  Icons.shopping_cart
  ),
  Icon(
  Icons.favorite
  ),
];
