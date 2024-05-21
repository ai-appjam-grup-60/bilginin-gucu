import 'package:ai_study_app/models/user_model.dart';

abstract class UserEvent {}

class UserUpdateEvent extends UserEvent {
  final UserProfile userProfile;
  final String userId;

  UserUpdateEvent({required this.userId, required this.userProfile});
}

class UserFetchEvent extends UserEvent {
  UserFetchEvent();
}

class UserDeleteEvent extends UserEvent {}
