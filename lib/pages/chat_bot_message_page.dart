import 'package:ai_study_app/logic/blocs/chat/chat_bloc.dart';
import 'package:ai_study_app/logic/blocs/chat/chat_event.dart';
import 'package:ai_study_app/logic/blocs/chat/chat_state.dart';
import 'package:ai_study_app/widgets/chat_page/chat_history_widget.dart';
import 'package:ai_study_app/widgets/chat_page/chat_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatBotMessagePage extends StatefulWidget {
  final String uid;
  String? discussionId;
  ChatBotMessagePage({
    super.key,
    required this.uid,
    this.discussionId,
  });

  @override
  State<ChatBotMessagePage> createState() => _ChatBotMessagePageState();
}

class _ChatBotMessagePageState extends State<ChatBotMessagePage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // initState içinde ChatResetEvent tetikleniyor
    context.read<ChatBloc>().add(ChatResetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Chat Bot"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context, true); // Geri dönüş değeri true olarak ayarlandı
            },
          )),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitialState) {
            if (widget.discussionId == null) {
              context.read<ChatBloc>().add(ChatEmptyDiscussionEvent());
            } else {
              context.read<ChatBloc>().add(ChatFetchEvent(
                  uid: widget.uid, discussionId: widget.discussionId!));
            }
          } else if (state is ChatFetchLoadingState) {
            return const Center(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is ChatFetchedState) {
            return ChatHistoryWidget(
              chatMessages: state.chatMessages,
              messageController: _messageController,
              widget: widget,
              onPressed: () {
                context.read<ChatBloc>().add(ChatAddMessageEvent(
                      message: _messageController.text,
                      uid: widget.uid,
                      discussionId: widget.discussionId,
                    ));
                context.read<ChatBloc>().add(ChatFetchResponseEvent(
                      uid: widget.uid,
                      message: _messageController.text,
                      discussionId: widget.discussionId,
                    ));
                _messageController.clear();
              },
            );
          } else if (state is ChatFetchErrorState) {
            return Center(
              child: Center(child: Text(state.errorMessage)),
            );
          } else if (state is ChatEmptyDiscussion) {
            return SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Image(
                          image: AssetImage("assets/png/logo.png"),
                          width: 200,
                        )),
                        SizedBox(height: 20),
                        Text("Merhaba, benimle sohbet etmek ister misin?"),
                      ],
                    ),
                  ),
                  ChatTextField(
                      messageController: _messageController,
                      onPressed: () {
                        context
                            .read<ChatBloc>()
                            .add(ChatAddFirstMessageEvent());
                        context.read<ChatBloc>().add(ChatAddMessageEvent(
                              message: _messageController.text,
                              uid: widget.uid,
                            ));
                        context.read<ChatBloc>().add(ChatFetchResponseEvent(
                              uid: widget.uid,
                              message: _messageController.text,
                            ));

                        _messageController.clear();
                      }),
                ],
              ),
            );
          } else if (state is ChatFirstMessageAddedState) {}
          return Container();
        },
      ),
    );
  }
}
