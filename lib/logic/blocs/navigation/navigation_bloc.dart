import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(HomePageState()) {
    on<HomePageClickedEvent>((event, emit) => emit(HomePageState()));
    on<VideoListPageClickedEvent>((event, emit) => emit(VideoListPageState()));
    on<AIAssistantClickedEvent>(
        (event, emit) => emit(AIAssistantPageState()));
  }
}
