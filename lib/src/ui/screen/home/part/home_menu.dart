part of '../home_screen.dart';

class HomeMenu extends StatelessWidget with WidgetMixin {
  HomeMenu({Key? key}) : super(key: key);

  List<Menu> menus = [
    Menu(label: "Cuti", icon: Asset.iconLeave),
    Menu(label: "Absen", icon: Asset.iconAttendance),
    Menu(label: "Laporan", icon: Asset.iconReport),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          color: DartdroidColor.primary,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: DartdroidColor.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...menus
                  .map(
                    (e) => MenuWidget(
                      label: e.label,
                      icon: e.icon,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
