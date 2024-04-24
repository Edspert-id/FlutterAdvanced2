import 'package:edspert_advance_2/model/course_model.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final CourseData course;

  const CourseDetail({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(course.courseName ?? 'No Course Name'),
          Text('${course.jumlahDone}/${course.jumlahMateri}'),
        ],
      ),
    );
  }
}
