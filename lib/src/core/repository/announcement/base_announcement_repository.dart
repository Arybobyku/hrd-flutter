import 'package:hrd/src/common/common.dart';

abstract class BaseAnnouncementRepository {
  Future<List<Announcement>> getAnnouncements();
}
