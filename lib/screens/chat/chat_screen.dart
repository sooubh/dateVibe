import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/support/report_user_dialog.dart';
import 'package:flutter_application_1/screens/support/block_user_dialog.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      "isMe": false,
      "message": "Sounds like a plan! Can't wait.",
      "time": "9:41 PM",
    },
    {"isMe": true, "message": "I'll pick you up at 7?", "time": "9:40 PM"},
    {"isMe": false, "message": "Perfect! See you then.", "time": "9:39 PM"},
    {
      "isMe": true,
      "message": "Great, looking forward to it!",
      "time": "9:38 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF221019)
          : const Color(0xFFF8F6F7),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF221019).withOpacity(0.8)
                    : const Color(0xFFF8F6F7).withOpacity(0.8),
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                      onPressed: () => Navigator.pop(context),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuBgOaMC0J51PodA57Ck8TGCI13aQJ9_0g-kDG4yIoHbKnGwOZ8uxBZFAuwNnnsBEDvcQ5EBqU7XlhQ4Dl65k2pWEfprnyzaaYRis6reCH6ASFIuOeeHvXIv5Q_Ue3v_jY77TsXJ4ZhvwWhYPb61BUggA7quhubqExsBBR-jo0gExBoRtLO2lFRW5dWXwkSpstytEaFCvhYziW5quzWAadHFgm-cxg2YE1m-T9PUn-6xe6jdTXCaR0oXFS1Nkf3GqbVQuEE2zTAYcjg",
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark
                                  ? const Color(0xFF221019)
                                  : const Color(0xFFF8F6F7),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Elara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                    child: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      onSelected: (value) {
                        if (value == 'report') {
                          showReportUserDialog(context, "Elara");
                        } else if (value == 'block') {
                          showBlockUserDialog(context, "Elara");
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: 'report',
                          child: Row(
                            children: [
                              Icon(Icons.flag_outlined, size: 20),
                              SizedBox(width: 8),
                              Text('Report User'),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'block',
                          child: Row(
                            children: [
                              Icon(Icons.block, size: 20),
                              SizedBox(width: 8),
                              Text('Block User'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Chat Area
            Expanded(
              child: _messages.isEmpty
                  ? Center(
                      child: Text(
                        "Say Hi 👋",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.color?.withOpacity(0.5),
                        ),
                      ),
                    )
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        final isMe = message["isMe"] as bool;

                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? Theme.of(context).primaryColor
                                  : (isDark
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.white),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20),
                                bottomLeft: isMe
                                    ? const Radius.circular(20)
                                    : Radius.zero,
                                bottomRight: isMe
                                    ? Radius.zero
                                    : const Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message["message"],
                                  style: TextStyle(
                                    color: isMe
                                        ? Colors.white
                                        : Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.color,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  message["time"],
                                  style: TextStyle(
                                    color: isMe
                                        ? Colors.white.withOpacity(0.7)
                                        : Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.color
                                              ?.withOpacity(0.5),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Input Area
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _messageController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.color?.withOpacity(0.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          setState(() {
                            _messages.insert(0, {
                              "isMe": true,
                              "message": _messageController.text,
                              "time": "Now",
                            });
                            _messageController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
