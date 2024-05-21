import 'package:ai_study_app/logic/blocs/user/user_bloc.dart';
import 'package:ai_study_app/logic/blocs/user/user_event.dart';
import 'package:ai_study_app/logic/blocs/user/user_state.dart';
import 'package:ai_study_app/pages/discussion_list_page.dart';
import 'package:ai_study_app/pages/home_page.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_bloc.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_state.dart';
import 'package:ai_study_app/pages/video_list_page.dart';
import 'package:ai_study_app/widgets/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    String uid;
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserFetchedState) {
            uid = state.user!.uid;
            return BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, state) {
                if (state is HomePageState) {
                  return const HomePage();
                } else if (state is VideoListPageState) {
                  return const VideoListPage();
                } else if (state is AIAssistantPageState) {
                  return DiscussionListPage(
                    uid: uid,
                  );
                }
                return Container();
              },
            );
          } else if (state is UserInitialState) {
            context.read<UserBloc>().add(UserFetchEvent());
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
