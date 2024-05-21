import 'package:ai_study_app/core/constants/route.constants.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_bloc.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial || state is AuthLoading) {
        } else if (state is AuthError) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, bottomNavigationRoute);
        } else {}
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/png/logo.png",
                width: deviceWidth / 1.80,
              ),
              SizedBox(height: deviceHeight / 5),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
