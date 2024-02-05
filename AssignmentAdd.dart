import 'package:flutter/material.dart';
import 'package:student_tracker_scratch/main.dart';

class AssignmentAdd extends StatefulWidget {
  AssignmentAdd({super.key, required this.title});

  final String title;

  @override
  State<AssignmentAdd> createState() => _AssignmentAddState();

  var trackpage;

}

class _AssignmentAddState extends State<AssignmentAdd> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => widget.trackpage
                )
              );
            }, 
            icon: const Icon(Icons.arrow_back),
          )
        ],
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
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
                      Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => widget.trackpage
                      )
                    );
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
      )
    );
  }




}