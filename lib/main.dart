import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/presentation/screens/choose_difficulty_screen.dart';
import 'package:sudoku_no_ads/presentation/screens/game_play_screen.dart';
import 'package:sudoku_no_ads/presentation/themes/app_theme.dart';
import 'presentation/screens/main_menu_screen.dart';
// import 'presentation/screens/choose_difficulty_screen.dart';

void main() {
  runApp(const ProviderScope(child: SudokuApp()));
  debugPaintBaselinesEnabled = false;
  // debugPaintPointersEnabled = true;
}

class SudokuApp extends StatelessWidget {
  const SudokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => MainMenuScreen(),
        routes: [
          GoRoute(
            path: 'chooseDifficulty',
            name: 'chooseDifficulty',
            builder: (context, state) => ChooseDifficultyScreen(),
            routes: [
              GoRoute(
                path: 'gamePlay',
                name: 'gamePlay',
                builder: (context, state) => GamePlayScreen(),
              )
            ]
          ),
        ]
      ),
    ],
  );
}
