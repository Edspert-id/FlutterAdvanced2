import 'package:bloc/bloc.dart';
import 'package:edspert_advance_2/model/exercise_model.dart';
import 'package:edspert_advance_2/repository/exercise_repository.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository exerciseRepository;

  ExerciseBloc(this.exerciseRepository) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseEvent) {
        emit(ExerciseLoading());
        final result = await exerciseRepository.getExerciseData(event.courseId);
        emit(ExerciseSuccess(exerciseList: result.data ?? []));
      }
    });
  }
}
