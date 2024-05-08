import 'package:edspert_advance_2/src/data/repositories/profile_repository_impl.dart';
import 'package:edspert_advance_2/src/domain/usecases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_source/auth_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/is_signed_in_with_google_usecase.dart';
import '../domain/usecases/sign_in_with_google_usecase.dart';
import 'manager/auth/auth_bloc.dart';
import 'manager/home_nav/home_nav_cubit.dart';
import 'manager/profile/profile_bloc.dart';
import 'screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
        BlocProvider(create: (context) => HomeNavCubit()),
        BlocProvider(
          create: (context) => ProfileBloc(
            UploadImageUsecase(ProfileRepositoryImpl()),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
