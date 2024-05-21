// ignore_for_file: prefer_const_constructors
import 'package:ai_study_app/core/routes/route.dart';
import 'package:ai_study_app/logic/blocs/discussion/discussion_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ai_study_app/firebase_options.dart';
import 'package:ai_study_app/logic/blocs/auth/auth_bloc.dart';
import 'package:ai_study_app/logic/blocs/chat/chat_bloc.dart';
import 'package:ai_study_app/logic/blocs/user/user_bloc.dart';
import 'package:ai_study_app/logic/repositories/auth_repository.dart';
import 'package:ai_study_app/logic/repositories/chat_bot_repository.dart';
import 'package:ai_study_app/logic/repositories/user_repository.dart';
import 'package:ai_study_app/pages/auth_control_page.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocListener(listeners: [
    BlocProvider(create: (context) => DiscussionBloc(ChatRepository())),
    BlocProvider(create: (context) => NavigationBloc()),
    BlocProvider(
        create: (context) => AuthBloc(
            AuthRepository(), UserRepository(), UserBloc(UserRepository()))),
    BlocProvider(create: (context) => UserBloc(UserRepository())),
    BlocProvider(create: (context) => ChatBloc(ChatRepository())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        home: const AuthControlPage(),
        onGenerateRoute: CustomRouter.generateRoute,
      ),
    );
  }
}
