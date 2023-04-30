import 'package:flutter/material.dart';
import 'package:yes_no_app/config/app_theme.dart';
import 'package:yes_no_app/presentation/views/chat_views/chat_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 5).theme(),
        title: 'Material App',
        home: const ChatView());
  }
}
