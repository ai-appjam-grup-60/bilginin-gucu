import 'package:ai_study_app/core/constants/padding_constants.dart';
import 'package:ai_study_app/logic/blocs/discussion/discussion_bloc.dart';
import 'package:ai_study_app/logic/blocs/discussion/discussion_event.dart';
import 'package:ai_study_app/logic/blocs/discussion/discussion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscussionListPage extends StatefulWidget {
  final String uid;
  const DiscussionListPage({super.key, required this.uid});

  @override
  State<DiscussionListPage> createState() => _DiscussionListPageState();
}

class _DiscussionListPageState extends State<DiscussionListPage> {
  @override
  void didUpdateWidget(DiscussionListPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Eğer geri dönüş değeri true ise, DiscussionBloc'a DiscussionResetEvent gönder
    if (ModalRoute.of(context)?.settings.arguments == true) {
      context.read<DiscussionBloc>().add(DiscussionResetEvent());
    }
  }

  @override
  void initState() {
    context.read<DiscussionBloc>().add(DiscussionResetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sohbet Listesi"),
        ),
        body: BlocBuilder<DiscussionBloc, DiscussionState>(
          builder: (context, state) {
            if (state is DiscussionInitialState) {
              context
                  .read<DiscussionBloc>()
                  .add(DiscussionFetchEvent(widget.uid));
              return Container();
            } else if (state is DiscussionFetchedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    NewDiscussionButton(widget: widget),
                    const Divider(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                        itemCount: state.discussionList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: AppPaddings.onlyBottomMedium,
                            child: Card(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/chat_bot',
                                      arguments: {
                                        'uid': widget.uid,
                                        'discussionId':
                                            state.discussionList[index].id
                                      });
                                },
                                child: ListTile(
                                    title:
                                        Text(state.discussionList[index].title),
                                    subtitle: Text(state
                                        .discussionList[index].startTime
                                        .toString()),
                                    leading: Icon(
                                      Icons.comment,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                          onPressed: () {
                                            context.read<DiscussionBloc>().add(
                                                DiscussionDeleteEvent(
                                                    uid: widget.uid,
                                                    discussionId: state
                                                        .discussionList[index]
                                                        .id));
                                          },
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is DiscussionFetchLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DiscussionFetchErrorState) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  NewDiscussionButton(widget: widget),
                ],
              ));
            }
            return const Text("Hata");
          },
        ));
  }
}

class NewDiscussionButton extends StatelessWidget {
  const NewDiscussionButton({
    super.key,
    required this.widget,
  });

  final DiscussionListPage widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/chat_bot', arguments: {
            'uid': widget.uid,
          }).then((value) {
            if (value == true) {
              context.read<DiscussionBloc>().add(DiscussionResetEvent());
            }
          });
        },
        child: Text(
          "Yeni Sohbet Oluştur",
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ));
  }
}
