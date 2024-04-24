import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/repository/course_repository.dart';
import 'package:edspert_advance_2/screens/course_detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  CourseResponse? courseResponse;

  @override
  void initState() {
    getCourseList();
    super.initState();
  }

  void getCourseList() async {
    courseResponse = await courseRepository.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Center(
              child: ((courseResponse?.data ?? []).isEmpty)
                  ? const CircularProgressIndicator()
                  : ListView.separated(
                      itemCount: courseResponse?.data?.length ?? 0,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetail(
                                    course: courseResponse?.data?[index] ??
                                        CourseData()),
                              )),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  courseResponse?.data?[index].courseName ??
                                      'No Course Name'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("next page"),
          )
        ],
      ),
    );
  }
}
