import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/ui/ui.dart';

import '../../../core/core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class ProfileView extends StatelessWidget with WidgetMixin {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthenticationDataCubit>().state.data;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: DartdroidColor.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: DartdroidColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${user.firstName.firstLetter}${user.lastname.firstLetter}",
                        style: DartDroidFonts.bold(fontSize: 18),
                      ),
                    ),
                    verticalSpace20,
                    Text(
                      "${user.firstName ?? ""} ${user.lastname}",
                      maxLines: 1,
                      style: DartDroidFonts.bold(
                        fontSize: 18,
                        color: DartdroidColor.white,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      user.employee?.branch?.name ?? "-",
                      style: DartDroidFonts.normal(
                        fontSize: 14,
                        color: DartdroidColor.white,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      user.mobilePhone ?? "-",
                      style: DartDroidFonts.normal(
                        fontSize: 14,
                        color: DartdroidColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TitleIconButton(
                      title: "Data Diri",
                      iconData: Icons.person,
                      onTap: () {},
                    ),
                    divider(),
                    TitleIconButton(
                      title: "Ubah Password",
                      iconData: Icons.lock,
                      onTap: () {},
                    ),
                    divider(),
                    TitleIconButton(
                      title: "Tentang",
                      iconData: Icons.info,
                      onTap: () {},
                    ),
                    divider(),
                    verticalSpace20,
                    Column(
                      children: [
                        ButtonRounded(
                          text: "Keluar",
                          invert: true,
                          onPressed: () => context
                              .read<AuthenticationActionCubit>()
                              .signOut(user.accessToken!),
                        ),
                      ],
                    ),
                    verticalSpace5,
                    Text(
                      "Version 0.0.1",
                      style: DartDroidFonts.normal(
                        fontSize: 12,
                        color: DartdroidColor.grey,
                      ),
                    ),
                    verticalSpace20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
