import 'package:edspert_advance_2/constants/color_constants.dart';
import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';

class AllCourseListScreen extends StatelessWidget {
  final List<CourseData> courseList;
  const AllCourseListScreen({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.edspertBlue,
        title: const Text(
          'Pilih Course',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: CourseListWidget(
        itemCount: courseList.length,
        courseList: courseList,
      ),
    );
  }
}
