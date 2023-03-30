import 'package:file/file.dart';
import 'base_directory_client.dart';

/// Directory client
///
/// Use `LocalFileSystem()` for real app and use `MemoryFileSystem()` for
/// unit testing purposes
class DirectoryClient extends BaseDirectoryClient {
  DirectoryClient._();
  static final DirectoryClient _instance = DirectoryClient._();
  factory DirectoryClient(FileSystem fileSystem) {
    _instance._fileSystem = fileSystem;

    return _instance;
  }

  late FileSystem _fileSystem;

  @override
  Directory directory(String path) => _fileSystem.directory(path);

  @override
  Future createDirectory(Directory directory) async => directory.create();
}
