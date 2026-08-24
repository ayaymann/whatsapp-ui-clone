import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppCloneTask());
}

class WhatsAppCloneTask extends StatelessWidget {
  const WhatsAppCloneTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Chat',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF181818),
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final Color greenColor = const Color(0xFF168C4B);
  final Color outgoingBg = const Color(0xFF232D36);
  final Color whiteColor = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/chat_bg.png'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  children: [
                    _buildMessageBubble(text: "Hello!", isIncoming: true),
                    _buildMessageBubble(text: "Hi!", isIncoming: false),
                    _buildMessageBubble(
                      text: "Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It’s like the universe loves to surprise us when we least expect it!",
                      isIncoming: true,
                    ),
                    _buildMessageBubble(
                      text: "what a great content to learn Flutter",
                      isIncoming: true,
                      hasImage: true,
                    ),
                    _buildMessageBubble(
                      text: "what a great day to learn Flutter!!",
                      isIncoming: false,
                    ),
                  ],
                ),
              ),
              _buildInputBar(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: greenColor,
      leadingWidth: 70,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Vector(Stroke).png', color: Colors.white, width: 12),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/profile_pic.png'),
          ),
        ],
      ),
      title: Text(
        'Aya Ayman',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
      ),
      actions: [
        Image.asset('assets/Phone_2.png', color: Colors.white, width: 22),
        const SizedBox(width: 16),
        Image.asset('assets/video.png', color: Colors.white, width: 24),
        const SizedBox(width: 16),
        Image.asset('assets/More-vertical.png', color: Colors.white, width: 6),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildMessageBubble({required String text, required bool isIncoming, bool hasImage = false}) {
    return Align(
      alignment: isIncoming ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isIncoming ? greenColor : outgoingBg,
          borderRadius: BorderRadius.only(
            topLeft: isIncoming ? const Radius.circular(0) : const Radius.circular(16),
            topRight: isIncoming ? const Radius.circular(16) : const Radius.circular(0),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: whiteColor, fontSize: 16),
            ),
            if (hasImage) ...[
              const SizedBox(height: 8.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/flutter_ad.png', fit: BoxFit.cover),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: whiteColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Type a Message ...",
                hintStyle: TextStyle(color: whiteColor, fontSize: 12),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/Camera.png', color: Colors.white, width: 24),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('assets/Send.png', color: Colors.white, width: 20),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: greenColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: greenColor, width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: greenColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/Mic.png', color: Colors.white, width: 22),
          ),
        ],
      ),
    );
  }
}