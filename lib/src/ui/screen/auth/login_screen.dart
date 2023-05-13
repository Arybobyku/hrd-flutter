import 'package:flutter/material.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/common/utility/dartdroid_fonts.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/core/bloc/authentication/authentication.dart';
import 'package:hrd/src/ui/ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatelessWidget with SnackBarMessageMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationActionCubit, BaseState<AuthMeta>>(
            listener: (context, state) {
              if (state is SuccessState &&
                  state.data != null &&
                  state.data?.type == AuthMetaType.signIn) {
                context.read<AuthenticationDataCubit>().initialize();
              }

              if (state is ErrorState) {
                showSnackBarMessage(context, (state as ErrorState).error);
              }
            },
          ),
        ],
        child: SafeArea(
          child: BlocBuilder<AuthenticationActionCubit, BaseState<AuthMeta>>(
            builder: (context, state) {
              return FullLoading(
                widget: SingleChildScrollView(
                  child: Stack(
                    children: [
                      header(context),
                      body(
                        context,
                      )
                    ],
                  ),
                ),
                isLoading: (state is LoadingState &&
                    state.data != null &&
                    state.data?.type == AuthMetaType.signIn),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3366FF),
            Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      Asset.logo,
                    ),
                  )),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Sign in to your \nAccount",
                style: DartDroidFonts.bold(
                  color: DartdroidColor.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Sign in to your Account",
                style: DartDroidFonts.normal(
                    color: DartdroidColor.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    String username = "superadmin@gmail.com";
    String password = "12345678";

    return Container(
      margin:
          EdgeInsets.only(top: (MediaQuery.of(context).size.height / 2) - 50),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: DartdroidColor.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormFieldRounded(
            label: "Username",
            //TODO: REMOVE
            initialValue: username,
            onChange: (value) {
              username = value;
            },
          ),
          const SizedBox(height: 30),
          TextFormFieldRounded(
            label: "Password",
            //TODO: REMOVE
            initialValue: password,
            onChange: (value) {
              password = value;
            },
            suffixIcon: const Icon(
              Icons.lock,
              color: DartdroidColor.black,
            ),
            secureText: true,
          ),
          const SizedBox(height: 20),
          Text(
            "Forgot Password?",
            style: DartDroidFonts.normal(color: DartdroidColor.primary),
          ),
          const SizedBox(height: 10),
          ButtonRounded(
            text: "Sign in",
            onPressed: () {
              context.read<AuthenticationActionCubit>().signIn(
                    userName: username,
                    password: password,
                  );
            },
          )
        ],
      ),
    );
  }
}
