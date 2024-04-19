import 'package:edspert_advance_2/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SubjectDetail extends StatelessWidget {
  final Subject subject;

  const SubjectDetail({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(subject.name),
          Text('${subject.exerciseDone}/${subject.exerciseTotal}'),
        ],
      ),
    );
  }
}
