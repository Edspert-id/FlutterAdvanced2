part of 'discussion_bloc.dart';

sealed class DiscussionState extends Equatable {
  const DiscussionState();
  
  @override
  List<Object> get props => [];
}

final class DiscussionInitial extends DiscussionState {}
