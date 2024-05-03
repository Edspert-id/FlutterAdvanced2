import 'package:edspert_advance_2/src/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository repository;

  SignInWithGoogleUsecase(this.repository);

  Future<String?> call() {
    return repository.signInWithGoogleUsecase();
  }
}
