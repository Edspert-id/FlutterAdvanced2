part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class UploadImageLoading extends ProfileState {}

final class UploadImageSuccess extends ProfileState {
  final String downloadUrl;

  const UploadImageSuccess(this.downloadUrl);
}

final class UploadImageError extends ProfileState {}
