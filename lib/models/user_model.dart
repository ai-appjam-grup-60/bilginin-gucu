import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String uid;
  String nameSurname;
  String email;
  String? profilePictureUrl;

  UserProfile({
    required this.uid,
    required this.nameSurname,
    required this.email,
    this.profilePictureUrl,
  });

  factory UserProfile.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic>? json = document.data() as Map<String, dynamic>?;

    json ??= {};

    return UserProfile(
      uid: json['uid'],
      nameSurname: json['nameSurname'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'nameSurname': nameSurname,
      'email': email,
      'profilePictureUrl': profilePictureUrl ??
          'https://cdn4.iconfinder.com/data/icons/education-circular-1-1/96/40-512.png',
    };
  }
}
