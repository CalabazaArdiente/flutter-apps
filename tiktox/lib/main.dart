import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktox/config/theme/app_theme.dart';
import 'package:tiktox/presentation/providers/discover_provider.dart';
import 'package:tiktox/presentation/views/discover/discover_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TikTox',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverView(),
      ),
    );
  }
}
