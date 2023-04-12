import 'package:chat_gpt/model/message_model.dart';
import 'package:chat_gpt/widget/chatMessage.dart';
import 'package:flutter/material.dart';
import 'controller/gpt_controller.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<MessageModel> _message = [];
  bool isLoding = false;

  void _sendMessage(String text) async {
    setState(() {
      _message.add(MessageModel(
          userMessage: text, botMessage: '', messageType: MessageType.user));
      isLoding = true;
    });

    String response = await generateResponse(text);

    setState(() {
      _message.add(MessageModel(
          userMessage: '', botMessage: response, messageType: MessageType.bot));
      isLoding = false;
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343541),
      appBar: AppBar(
        backgroundColor: const Color(0xff444654),
        title: const Text("chatGPT ChatBot"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context, index) {
                var message = _message[index];
                return ChatMessageWidget(
                    userMessage: message.userMessage,
                    botMessage: message.botMessage,
                    messageType: message.messageType);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "메세지를 입력하세요! ",
                      fillColor: Color(0xff444654),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _sendMessage(_controller.text);
                    _controller.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Color.fromRGBO(142, 142, 160, 1),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
