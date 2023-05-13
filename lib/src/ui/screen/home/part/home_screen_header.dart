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
            style: DartDroidFonts.normal(
              fontSize: 12,
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
                    verticalSpace(4),
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
          verticalSpace20,
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: DartdroidColor.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        "Jadwal Kerja",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DartDroidFonts.bold(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jun, 11 Okt 2023",
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: DartDroidFonts.normal(),
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Text(
                  "09:00 AM - 06:00 PM",
                  style: DartDroidFonts.bold(
                    fontSize: 20,
                  ),
                ),
                verticalSpace(2),
                Text(
                  "Jam Kerja",
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: DartDroidFonts.normal(
                    fontSize: 14,
                  ),
                ),
                divider(),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: DartdroidColor.redDarken40,
                    ),
                    horizontalSpace(5),
                    Expanded(
                      child: Text(
                        "Universitas Sumatera Utara jalan menteng indah VI-6 Universitas Sumatera Utara jalan menteng indah VI-6",
                        style: DartDroidFonts.normal(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                divider(),
                Row(
                  children: [
                    Expanded(
                      child: ButtonRounded(
                        text: "Masuk",
                        borderRadius: 5,
                        fontWeight: FontWeight.normal,
                        onPressed: () {},
                      ),
                    ),
                    horizontalSpace20,
                    Expanded(
                      child: ButtonRounded(
                        text: "Keluar",
                        disabled: true,
                        borderRadius: 5,
                        fontWeight: FontWeight.normal,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
