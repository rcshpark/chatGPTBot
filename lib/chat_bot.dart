import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/gpt_controller.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _message = [];

  void _sendMessage(String text) async {
    setState(() {
      _message.add("user_message: $text");
    });

    String response = await generateResponse(text);

    setState(() {
      _message.add('chatGPT : $response');
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chatGPT Bot"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_message[index]),
                );
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
                    decoration: const InputDecoration(hintText: "메세지를 입력하세요! "),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                  icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
