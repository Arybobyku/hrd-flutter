part of '../home_screen.dart';

class HomeScreenHeader extends StatelessWidget {
  final User user;

  const HomeScreenHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(color: DartdroidColor.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PT ENERGI BERSAMA",
            maxLines: 1,
            style: TextStyle(fontSize: 14, color: DartdroidColor.white),
          ),
          const SizedBox(height: 15),
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
                      style: TextStyle(
                        fontSize: 22,
                        color: DartdroidColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Software Developer",
                      style:
                          TextStyle(fontSize: 14, color: DartdroidColor.white),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: DartdroidColor.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jun, 11 Okt 2023",
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "09:00 AM - 06:00 PM",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Jam Kerja",
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 12),
                Divider(
                  height: 1,
                  color: DartdroidColor.greyLighten30,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: DartdroidColor.redDarken40,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Universitas Sumatera Utara jalan menteng indah VI-6 Universitas Sumatera Utara jalan menteng indah VI-6",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  height: 1,
                  color: DartdroidColor.greyLighten30,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ButtonRounded(
                        text: "Masuk",
                        borderRadius: 5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ButtonRounded(
                        text: "Keluar",
                        disabled: true,
                        borderRadius: 5,
                        fontWeight: FontWeight.normal,
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
