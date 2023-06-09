import 'package:dio/dio.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/repository/announcement/base_announcement_repository.dart';

class AnnouncementRepository implements BaseAnnouncementRepository {
  final BaseApiClient apiClient;

  AnnouncementRepository({required this.apiClient});

  @override
  Future<List<Announcement>> getAnnouncements() async {
    Response response = await apiClient.get(Url.baseUrl + Url.announcement);

    final listMap =
        BaseResponse.fromJson(response.data, (json) => json as List).data;

    List<Announcement> announcements = [];

    for (Map data in listMap) {
      announcements.add(
        Announcement.fromJsonApi(
          Map<String, dynamic>.from(data),
        ),
      );
    }

    return announcements;
  }
}
