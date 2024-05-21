import 'package:ai_study_app/core/error_toast.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_bloc.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_event.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
        } else if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Anasayfa"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogout());
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              color: Colors.transparent,
              child: const Image(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/ged-flod/google_gemini/main/assets/gemini.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  height: 200.h,
                  width: 0.50.sw,
                  color: Colors.transparent,
                  child: const Image(
                    image: NetworkImage(
                        "https://i.ytimg.com/vi/4sCa4ekLB5Q/maxresdefault.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 0.50.sw,
                      color: Colors.transparent,
                      child: const Image(
                        image: NetworkImage(
                            "https://media.geeksforgeeks.org/wp-content/uploads/20240319155102/what-is-ai-artificial-intelligence.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: 0.50.sw,
                      color: Colors.transparent,
                      child: const Image(
                        image: NetworkImage(
                            "https://tzv.org.tr/wp-content/uploads/2023/08/ChatGPT-Nedir.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
