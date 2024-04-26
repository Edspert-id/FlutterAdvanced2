import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/screens/course_detail.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final int itemCount;
  final List<CourseData> courseList;
  const CourseListWidget({
    super.key,
    required this.itemCount,
    required this.courseList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final course = courseList[index];

        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetail(course: course),
              )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    course.urlCover ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      course.courseName ?? 'No Course Name',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
