import 'package:edspert_advance_2/bloc/banner/banner_bloc.dart';
import 'package:edspert_advance_2/bloc/course/course_bloc.dart';
import 'package:edspert_advance_2/constants/color_constants.dart';
import 'package:edspert_advance_2/model/banner_model.dart';
import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/repository/banner_repository.dart';
import 'package:edspert_advance_2/repository/course_repository.dart';
import 'package:edspert_advance_2/screens/all_course_list_screen.dart';
import 'package:edspert_advance_2/widgets/course_list_widget.dart';
import 'package:edspert_advance_2/widgets/image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc(courseRepository: CourseRepository())
            ..add(GetCourseEvent()),
        ),
        BlocProvider(
          create: (context) =>
              BannerBloc(BannerRepository())..add(GetBannerEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorConstants.greyBackground,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 147,
                  decoration: BoxDecoration(
                    color: ColorConstants.edspertBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 26, left: 20),
                          child: Text(
                            'Mau kerjain\nlatihan soal\napa hari ini?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/images/home-banner.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
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
                                if (state is CourseSuccess) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AllCourseListScreen(
                                          courseList: state.courseList,
                                        ),
                                      ));
                                }
                              },
                              child: const Text('Lihat Semua'),
                            )
                          ],
                        ),
                        if (state is CourseSuccess)
                          _buildCourseListWidget(state.courseList)
                        else
                          const CircularProgressIndicator(),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 27),
                BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Terbaru',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (state is BannerSuccess)
                          _buildBannerListWidget(state.bannerList)
                        else
                          const Center(child: CircularProgressIndicator())
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBannerListWidget(List<BannerData> bannerList) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final banner = bannerList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageNetworkWidget(
              imageUrl: banner.eventImage ?? '',
              height: 146,
              width: 284,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: bannerList.length,
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
