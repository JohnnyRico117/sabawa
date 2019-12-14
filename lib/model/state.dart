import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sabawa/model/user.dart';
import 'package:sabawa/model/project.dart';

class StateModel {
  bool isLoading;
  FirebaseUser user;
  bool newUser;
  User currentUser;
  Project currentProject;
  DocumentSnapshot currentProjectSnap;
  String currentProjectID;
  String currentProjectName;

  StateModel({
    this.isLoading = false,
    this.user,
    this.newUser,
    this.currentUser,
    this.currentProject,
    this.currentProjectSnap,
    this.currentProjectID = "",
    this.currentProjectName = ""
  });
}