import 'package:edspert_advance_2/src/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<bool> call() {
    return repository.registerUsecase();
  }
}
