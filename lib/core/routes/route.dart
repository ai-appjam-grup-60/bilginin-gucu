import 'package:ai_study_app/core/constants/route.constants.dart';
import 'package:ai_study_app/pages/bottom_navbar.dart';
import 'package:ai_study_app/pages/chat_bot_message_page.dart';
import 'package:ai_study_app/pages/discussion_list_page.dart';
import 'package:ai_study_app/pages/splash_page.dart';
import 'package:ai_study_app/pages/video_list_page.dart';
import 'package:ai_study_app/pages/video_page.dart';
import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/sign_in_page.dart';
import '../../pages/sign_up_page.dart';
import '../../pages/auth_control_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case authControlRoute:
        return MaterialPageRoute(builder: (_) => const AuthControlPage());
      case chatBotRoute:
        if (args is Map<String, dynamic>?) {
          final String uid = args!['uid'] as String;
          if (args['discussionId'] == null) {
            return MaterialPageRoute(
              builder: (_) => ChatBotMessagePage(
                uid: uid,
              ),
            );
          }
          final String discussionId = args['discussionId'] as String;
          return MaterialPageRoute(
            builder: (_) => ChatBotMessagePage(
              uid: uid,
              discussionId: discussionId,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => Container());
      case discussionListRoute:
        return MaterialPageRoute(
            builder: (_) => DiscussionListPage(
                  uid: args as String,
                ));
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case videoListRoute:
        return MaterialPageRoute(builder: (_) => const VideoListPage());
      case videoPageRoute:
        return MaterialPageRoute(builder: (_) => const VideoPage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case bottomNavigationRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());

      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text('No route defined for '),
          ),
        );
    }
  }
}
