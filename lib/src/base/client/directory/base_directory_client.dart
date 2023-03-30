import 'package:file/file.dart';

/// Directory client interface
abstract class BaseDirectoryClient {
  Directory directory(String path);
  Future createDirectory(Directory directory);
}
