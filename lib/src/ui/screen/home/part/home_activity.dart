part of '../home_screen.dart';

class HomeActivity extends StatelessWidget with WidgetMixin{
  HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aktifitas Hari ini",
            style: DartDroidFonts.bold(fontSize: 18),
          ),
          verticalSpace20,
          ActivityCard(),
        ],
      ),
    );
  }
}
