import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_advance_2/constants/api_constants.dart';
import 'package:edspert_advance_2/model/exercise_model.dart';

class ExerciseRepository {
  Future<ExerciseResponse> getExerciseData(String courseId) async {
    try {
      final exercisePath = '${ApiContants.apiUrl}${ApiContants.exercisePath}';
      final queryParameters = {
        'sub_course_content_id': courseId,
        'user_email': 'testerngbayu@gmail.com',
      };
      final response = await Dio().get(
        exercisePath,
        queryParameters: queryParameters,
        options: Options(headers: ApiContants.headers),
      );
      log('Response: ${response.data}');

      final data = ExerciseResponse.fromJson(response.data);

      return data;
    } catch (e, stackTrace) {
      log('Error at getExerciseData: ${e.toString()}', stackTrace: stackTrace);
      return ExerciseResponse();
    }
  }
}
