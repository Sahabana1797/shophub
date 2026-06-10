import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "message": "Hello, is this product available?",
      "isMe": true,
    },
    {
      "message": "Yes, it is available.",
      "isMe": false,
    },
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      messages.add({
        "message": messageController.text,
        "isMe": true,
      });
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: const Color(0xffFF6F00),
        foregroundColor: Colors.white,
        title: const Text("Chat Owner"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                return Align(
                  alignment: msg["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    padding:
                        const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg["isMe"]
                          ? const Color(
                              0xffFF6F00)
                          : Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                              15),
                    ),
                    child: Text(
                      msg["message"],
                      style: TextStyle(
                        color: msg["isMe"]
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller:
                        messageController,
                    decoration:
                        InputDecoration(
                      hintText:
                          "Type a message...",
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(25),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  backgroundColor:
                      const Color(0xffFF6F00),
                  child: IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}