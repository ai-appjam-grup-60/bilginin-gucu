import 'package:ai_study_app/core/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController messageController,
    required this.onPressed,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: AppPaddings.allMedium,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Mesaajınızı yazınız...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
