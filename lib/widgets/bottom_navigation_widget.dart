import 'package:ai_study_app/core/constants/borders_constants.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_bloc.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_event.dart';
import 'package:ai_study_app/logic/blocs/navigation/navigation_state.dart';
import 'package:ai_study_app/core/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_item_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          AppBorders.verticalTopMedium, // Kenarları yuvarlak yapmak için
      child: BottomAppBar(
        child: Padding(
          padding: AppPaddings.verticalSmall, // Dikey padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, state) {
                  return BottomNavigationItemWidget(
                    text: "Anasayfa",
                    icon: Icons.home,
                    selected: state is HomePageState,
                    onPressed: () {
                      context
                          .read<NavigationBloc>()
                          .add(HomePageClickedEvent());
                    },
                  );
                },
              ),
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, state) {
                  return BottomNavigationItemWidget(
                    text: "Video Listesi",
                    icon: Icons.video_library,
                    selected: state is VideoListPageState,
                    onPressed: () {
                      context
                          .read<NavigationBloc>()
                          .add(VideoListPageClickedEvent());
                    },
                  );
                },
              ),
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, state) {
                  return BottomNavigationItemWidget(
                    text: "AI Asistan",
                    icon: Icons.person,
                    selected: state is AIAssistantPageState,
                    onPressed: () {
                      context
                          .read<NavigationBloc>()
                          .add(AIAssistantClickedEvent());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
