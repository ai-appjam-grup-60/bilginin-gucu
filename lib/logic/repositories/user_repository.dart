import 'package:ai_study_app/core/constants/collection_names.dart';
import 'package:ai_study_app/core/firebase_firestore_exception.dart';
import 'package:ai_study_app/logic/repositories/auth_repository.dart';
import 'package:ai_study_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(Collections.USERS);

  Future<void> createUser(String email, String uid, String nameSurname) async {
    try {
      UserProfile userProfile =
          UserProfile(uid: uid, email: email, nameSurname: nameSurname);
      await collectionReference.doc(uid).set(userProfile.toFirestore());
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }

  Future<Object> fetchUser() async {
    String? uid = AuthRepository().getUserId();
    try {
      final userProfileDb = await collectionReference.doc(uid).get();
      final userProfile = UserProfile.fromFirestore(userProfileDb);
      return userProfile;
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        return errorMessage;
      }
      return e;
    }
  }

  Future<void> updateUser(UserProfile userProfile, String uid) async {
    try {
      await collectionReference.doc(uid).update(userProfile.toFirestore());
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }
}
