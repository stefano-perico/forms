import 'package:forms/models/avatar.dart';
import 'package:uuid/uuid.dart';

class User {
  String uid;
  String name;
  Avatar? avatar;

  User({
    required this.name,
    this.avatar,
  }) : uid = const Uuid().v4();

  void updateAvatar(Avatar newAvatar) {
    avatar = newAvatar;
  }
}
