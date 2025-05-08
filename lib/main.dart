import 'package:flutter/material.dart';
import 'package:realmate_challenge_front/screens/chat_screen.dart';
import 'package:realmate_challenge_front/state/chat_context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedChatId = 'none';

    void _updateChatId(String newId) {
    setState(() {
      _selectedChatId = newId;
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChatContext(
      selectedChatId: _selectedChatId,
      onSelectChat: _updateChatId,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ChatScreen(),
      ),
    );
  }
}