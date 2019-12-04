import 'package:firebase_auth/firebase_auth.dart';
import 'package:sabawa/model/user.dart';

class StateModel {
  bool isLoading;
  FirebaseUser user;
  bool newUser;
  User currentUser;
  String currentProjectID;
  String currentProjectName;

  StateModel({
    this.isLoading = false,
    this.user,
    this.newUser,
    this.currentUser,
    this.currentProjectID = "",
    this.currentProjectName = ""
  });
}