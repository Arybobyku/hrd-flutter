import 'package:flutter/material.dart';
import 'package:hrd/src/base/bloc/bloc.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/core.dart';
import 'package:hrd/src/ui/ui.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnnouncementDataCubit>(
      create: (context) => AnnouncementDataCubit(
        announcementRepository: context.read<BaseAnnouncementRepository>(),
      )..initialize(),
      child: AnnouncementView(),
    );
  }
}

class AnnouncementView extends StatelessWidget with WidgetMixin {
  AnnouncementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: BlocBuilder<AnnouncementDataCubit, BaseState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is EmptyState) {
                return EmptyRefreshWidget(
                  onRefresh: () async {
                    context.read<AnnouncementDataCubit>().initialize();
                  },
                );
              }

              if (state is ErrorState) {
                return ErrorRefreshWidget(
                  message: state.error,
                  onRefresh: () async {
                    context.read<AnnouncementDataCubit>().initialize();
                  },
                );
              }

              if (state is LoadedState) {
                var announcement = (state.data as List<Announcement>);

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<AnnouncementDataCubit>().initialize();
                  },
                  child: ListView.builder(
                    itemCount: announcement.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: DartdroidColor.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: DartdroidColor.primary),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    announcement[index].title ?? "-",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: DartDroidFonts.bold(fontSize: 16),
                                  ),
                                ),
                                horizontalSpace20,
                                Text(
                                  announcement[index].publish?.dateFormat ??
                                      "-",
                                  style: DartDroidFonts.normal(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace10,
                            Text(
                              announcement[index].description ?? "-",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: DartDroidFonts.normal(fontSize: 14),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
