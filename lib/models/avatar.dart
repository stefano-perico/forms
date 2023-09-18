import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

final class Avatar {
  String id;
  String name;
  String path;

  Avatar({
    required this.name,
    required this.path,
  }) : id = const Uuid().v4();

  Future<List<Avatar>> getAvatars() async {
    final directory = await getApplicationDocumentsDirectory();
    final avatarDirectory = Directory('${directory.path}/avatars');

    if (!await avatarDirectory.exists()) {
      return [];
    }

    final avatarFiles = await avatarDirectory.list().toList();
    final avatars = <Avatar>[];

    for (final avatarFile in avatarFiles) {
      if (avatarFile is File) {
        avatars.add(Avatar(
            name: avatarFile.uri.pathSegments.last, path: avatarFile.path));
      }
    }

    return avatars;
  }
}
