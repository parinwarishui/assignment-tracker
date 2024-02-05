import 'package:flutter/material.dart';
import 'package:student_tracker_scratch/main.dart';

class AssignmentTrack extends StatefulWidget {
  AssignmentTrack({super.key, required this.title});

  final String title;

  @override
  State<AssignmentTrack> createState() => _AssignmentTrackState();

}

class _AssignmentTrackState extends State<AssignmentTrack> {

  List<Assignment> assignments = [];

  TextEditingController assignmentController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  // for adding an assignment
  void addAssignment(String title, String subject) {
    setState(() {
      assignments.add(Assignment(title: title, subject: subject));
      assignmentController.clear();
      subjectController.clear();
    });
  }

  void markAsDone(int index) {
    setState(() {
      assignments[index].isDone = true;
    });
  }

  // removing assignments after checkboxed
  void removeDoneAssignments() {
    setState(() {
      assignments.removeWhere((assignment) => assignment.isDone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(assignments[index].title),
                  subtitle: Text(assignments[index].subject),
                  trailing: Checkbox(
                    value: assignments[index].isDone,
                    onChanged: (value) {
                      markAsDone(index);
                    },
                  ),
                );
              },
            ),
          ),

        ElevatedButton(
            onPressed: () {
              removeDoneAssignments();
            },
            child: const Text('Remove Done Assignments'),
          ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text('Assignment'),
                ),
                Expanded(
                  child: TextField(
                    controller: assignmentController,
                    decoration: const InputDecoration(
                      hintText: 'Add Assignment',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text('Description'),
                ),
                Expanded(
                  child: TextField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                      hintText: 'Add Description',
                    ),
                  ),
                ),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children:
              [
              const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (assignmentController.text.isNotEmpty) {
                      addAssignment(assignmentController.text, subjectController.text);
                    }
                    else {
                      
                    }
                  },
                  child: const Text('Add Assignment'),
                ),
              ]
            )
          ),
        ]
      ),

    );
  }
}
