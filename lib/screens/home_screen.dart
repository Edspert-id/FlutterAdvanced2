import 'package:edspert_advance_2/bloc/course/course_bloc.dart';
import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/repository/course_repository.dart';
import 'package:edspert_advance_2/screens/all_course_list_screen.dart';
import 'package:edspert_advance_2/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(courseRepository: CourseRepository())
        ..add(GetCourseEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, Altop',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(radius: 16),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                print('Current State: ${state.runtimeType}');
                if (state is CourseSuccess) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pilih Course',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllCourseListScreen(
                                        courseList: state.courseList,
                                      ),
                                    ));
                              },
                              child: const Text('Lihat Semua'))
                        ],
                      ),
                      _buildCourseListWidget(state.courseList),
                    ],
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseListWidget(List<CourseData> courseList) {
    final courseCount = courseList.length > 3 ? 3 : courseList.length;

    return courseList.isEmpty
        ? const CircularProgressIndicator()
        : CourseListWidget(
            itemCount: courseCount,
            courseList: courseList,
          );
  }
}
