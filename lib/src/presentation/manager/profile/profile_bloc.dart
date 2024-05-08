import 'package:bloc/bloc.dart';
import 'package:edspert_advance_2/src/domain/usecases/upload_image_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UploadImageUsecase uploadImageUsecase;
  ProfileBloc(this.uploadImageUsecase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is UploadImageEvent) {
        emit(UploadImageLoading());
        final uploadImageDownloadResult = await uploadImageUsecase(event.file);
        if (uploadImageDownloadResult != null) {
          emit(UploadImageSuccess(uploadImageDownloadResult));
          return;
        }

        emit(UploadImageError());
      }
    });
  }
}
