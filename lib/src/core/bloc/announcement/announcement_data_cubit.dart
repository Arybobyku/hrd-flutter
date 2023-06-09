import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/repository/announcement/base_announcement_repository.dart';

class AnnouncementDataCubit extends Cubit<BaseState> {
  final BaseAnnouncementRepository announcementRepository;

  AnnouncementDataCubit({required this.announcementRepository})
      : super(const InitializedState());

  void initialize() async {
    emit(const LoadingState());
    try {
      List<Announcement> announcements =
          await announcementRepository.getAnnouncements();

      if (announcements.isEmpty) {
        return emit(const EmptyState());
      }

      emit(
        LoadedState(
          data: announcements,
        ),
      );
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
