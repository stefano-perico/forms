import 'package:uuid/uuid.dart';

final class Avatar {
  String id;
  String name;
  String path;

  Avatar({
    required this.name,
    required this.path,
  }) : id = const Uuid().v4();
}
