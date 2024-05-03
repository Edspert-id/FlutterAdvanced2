import 'package:edspert_advance_2/src/data/data_source/auth_data_source.dart';
import 'package:edspert_advance_2/src/data/repositories/auth_repository_impl.dart';
import 'package:edspert_advance_2/src/domain/usecases/is_signed_in_with_google_usecase.dart';
import 'package:edspert_advance_2/src/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:edspert_advance_2/src/presentation/manager/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';

List<BlocProvider> blocProviders = [
      BlocProvider(
        create: (context) {
          AuthDataSource authDataSource = AuthDataSource();
          AuthRepository authRepository = AuthRepositoryImpl(authDataSource);
          return AuthBloc(
            IsSignedInWithGoogleUsecase(authRepository),
            SignInWithGoogleUsecase(authRepository),
          );
        },
      ),
    ];
