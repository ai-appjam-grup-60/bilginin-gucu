import 'package:ai_study_app/core/constants/padding_constants.dart';
import 'package:ai_study_app/core/constants/route.constants.dart';
import 'package:ai_study_app/core/error_toast.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_bloc.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_event.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_state.dart';
import 'package:ai_study_app/logic/blocs/user/user_bloc.dart';
import 'package:ai_study_app/logic/blocs/user/user_event.dart';
import 'package:ai_study_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUpPage> {
  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    nameSurnameController.dispose();
    super.dispose();
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameSurnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, bottomNavigationRoute);
        } else if (state is AuthLoading) {}
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/jpg/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Padding(
              padding: AppPaddings.allExtraLarge,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: AppPaddings.verticalLarge +
                              AppPaddings.onlyTopLarge,
                          child: Image.asset(
                            "assets/png/logo.png",
                            width: 200,
                          ),
                        ),
                        Container(
                          padding: AppPaddings.horizontalLarge +
                              AppPaddings.onlyTopLarge,
                          child: SignTextField(
                              isPassword: false,
                              controller: nameSurnameController,
                              labelText: "Ad Soyad",
                              icon: const Icon(
                                Icons.person,
                              )),
                        ),
                        Container(
                          padding: AppPaddings.horizontalLarge +
                              AppPaddings.onlyTopLarge,
                          child: SignTextField(
                            isPassword: false,
                            controller: mailController,
                            labelText: "E-Posta",
                            icon: const Icon(Icons.email),
                          ),
                        ),
                        Container(
                          padding: AppPaddings.horizontalLarge +
                              AppPaddings.onlyTopLarge,
                          child: SignTextField(
                            isPassword: true,
                            controller: passwordController,
                            labelText: "Parola",
                            icon: const Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                        Container(
                          padding: AppPaddings.horizontalLarge +
                              AppPaddings.onlyTopLarge,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              minimumSize: Size(screenWidth * 0.8, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text("Kayıt Ol",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              context.read<UserBloc>().add(UserDeleteEvent());
                              context.read<AuthBloc>().add(AuthSignUp(
                                    eMail: mailController.text,
                                    password: passwordController.text,
                                    nameSurname: nameSurnameController.text,
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/sign_in");
                          },
                          child: const Text("Giriş Yap"),
                        ),
                        Padding(padding: AppPaddings.verticalMedium),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
