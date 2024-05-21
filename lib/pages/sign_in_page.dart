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

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignInPage> {
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    eMailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, bottomNavigationRoute);
        } else if (state is AuthLoading) {
          const CircularProgressIndicator();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/jpg/background.jpg"),
                fit: BoxFit.fill),
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
                          padding: AppPaddings.horizontalExtraLarge +
                              AppPaddings.onlyTopLarge,
                          child: SignTextField(
                              isPassword: false,
                              controller: eMailController,
                              labelText: "E-posta Adresi",
                              icon: const Icon(
                                Icons.email,
                              ))),
                      Container(
                        padding: AppPaddings.horizontalExtraLarge +
                            AppPaddings.onlyTopMedium,
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
                        padding: AppPaddings.horizontalExtraLarge +
                            AppPaddings.onlyTopLarge,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondary, // Buton rengini tema rengi olarak ayarla
                              minimumSize: Size(screenWidth * 0.8,
                                  50), // Buton boyutunu ekran genişliğine göre ayarla
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: const Text("Giriş Yap",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            context.read<UserBloc>().add(UserDeleteEvent());
                            context.read<AuthBloc>().add(AuthSignIn(
                                eMail: eMailController.text,
                                password: passwordController.text));
                          },
                        ),
                      ),
                      Padding(padding: AppPaddings.verticalSmall),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/sign_up");
                          },
                          child: const Text("Kayıt Ol")),
                      const Divider(
                        color: Colors.grey,
                        height: 30,
                        thickness: 1,
                      ),
                      Container(
                        padding: AppPaddings.onlyBottomSmall,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (eMailController.text.isNotEmpty) {
                                  context.read<AuthBloc>().add(
                                      AuthPasswordReset(
                                          eMail: eMailController.text));
                                  ToastHelper.showSuccesToast(
                                      "Şifre sıfırlama maili gönderildi.");
                                } else {
                                  ToastHelper.showErrorToast(
                                      "Lütfen e-posta adresinizi giriniz.");
                                }
                              },
                              child: const Text(
                                "Şifremi Unuttum",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
