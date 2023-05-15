part of '../home_screen.dart';

class HomeScreenHeader extends StatelessWidget with WidgetMixin {
  final User user;

  HomeScreenHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: double.infinity,
      decoration: const BoxDecoration(color: DartdroidColor.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PT ENERGI BERSAMA",
            maxLines: 1,
            style: DartDroidFonts.bold(
              fontSize: 14,
              color: DartdroidColor.white,
            ),
          ),
          verticalSpace15,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName ?? ""} ${user.lastname}",
                      maxLines: 1,
                      style: DartDroidFonts.bold(
                        fontSize: 22,
                        color: DartdroidColor.white,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      "Software Developer",
                      style: DartDroidFonts.normal(
                        fontSize: 14,
                        color: DartdroidColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace5,
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: DartdroidColor.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "AB",
                  style: DartDroidFonts.bold(fontSize: 18),
                ),
              )
            ],
          ),
          verticalSpace10,
        ],
      ),
    );
  }
}
