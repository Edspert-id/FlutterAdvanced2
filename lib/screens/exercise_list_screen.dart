import 'package:edspert_advance_2/bloc/exercise/exercise_bloc.dart';
import 'package:edspert_advance_2/repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseListScreen extends StatelessWidget {
  final String courseId;

  const ExerciseListScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(ExerciseRepository())
        ..add(
          GetExerciseEvent(courseId),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.exerciseList.length,
                itemBuilder: (context, index) {
                  final exercise = state.exerciseList[index];
                  return Text(exercise.exerciseTitle ?? 'No Title');
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
