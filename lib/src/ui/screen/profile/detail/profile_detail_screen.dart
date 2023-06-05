import 'package:flutter/material.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/ui/ui.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    User? args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as User;
    }
    return ProfileDetailView(
      user: args,
    );
  }
}

class ProfileDetailView extends StatelessWidget with WidgetMixin {
  final User? user;

  ProfileDetailView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Profile"),
      ),
      backgroundColor: DartdroidColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace20,
                Text(
                  "Data Pribadi",
                  style: DartDroidFonts.bold(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Nama Depan",
                        value: user?.firstName ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "Nama Belakang",
                        value: user?.lastname ?? "-",
                      ),
                    ),
                  ],
                ),
                TitleValueWidget(
                  title: "Email",
                  value: user?.email ?? "-",
                ),
                TitleValueWidget(
                  title: "No Hp",
                  value: user?.mobilePhone ?? "-",
                ),
                TitleValueWidget(
                  title: "Status Perkawinan",
                  value: user?.martialStatus ?? "-",
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Golongan Darah",
                        value: user?.bloodType ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "Agama",
                        value: user?.religion ?? "-",
                      ),
                    ),
                  ],
                ),
                divider(),
                Text(
                  "Identitas ",
                  style: DartDroidFonts.bold(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Jenis Identitas",
                        value: user?.userIdentity?.identityType ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "Nomor Identitas",
                        value: user?.userIdentity?.identityNumber ?? "-",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Kode POS",
                        value: user?.userIdentity?.postalCode ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "NIK",
                        value: user?.userIdentity?.citizenIdAddress ?? "-",
                      ),
                    ),
                  ],
                ),
                TitleValueWidget(
                  title: "Alamat (sesuai KTP)",
                  value: user?.userIdentity?.residentialAddress ?? "-",
                ),
                divider(),
                Text(
                  "Data Karyawan",
                  style: DartDroidFonts.bold(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Cabang",
                        value: user?.employee?.branch?.name ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "Departemen",
                        value: user?.employee?.department?.name ?? "-",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleValueWidget(
                        title: "Posisi",
                        value: user?.employee?.position?.name ?? "-",
                      ),
                    ),
                    Expanded(
                      child: TitleValueWidget(
                        title: "Status",
                        value: user?.employee?.employmentStatus ?? "-",
                      ),
                    ),
                  ],
                ),
                TitleValueWidget(
                  title: "Tgl Masuk",
                  value: user?.employee?.joinDate ?? "-",
                ),
                TitleValueWidget(
                  title: "Status",
                  value: user?.userShift?.shift?.name ?? "-",
                ),
                verticalSpace20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
