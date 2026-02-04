import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/helpers/app_lifecycle_observer.dart';
import 'package:sudoku_no_ads/data/boxes.dart';
import 'package:sudoku_no_ads/data/game_result.dart';
import 'package:sudoku_no_ads/presentation/screens/choose_difficulty_screen.dart';
import 'package:sudoku_no_ads/presentation/screens/game_play_screen.dart';
import 'package:sudoku_no_ads/presentation/screens/history_screen.dart';
import 'package:sudoku_no_ads/presentation/themes/app_theme.dart';
import 'presentation/screens/main_menu_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GameResultAdapter());
  boxGameResults = await Hive.openBox<GameResult>('gameResultsBox');

  runApp(const ProviderScope(child: SudokuApp()));
  debugPaintBaselinesEnabled = false;
  // debugPaintPointersEnabled = true;
}

class SudokuApp extends ConsumerStatefulWidget {
  const SudokuApp({super.key});

  @override
  ConsumerState<SudokuApp> createState() => _SudokuAppState();
}

class _SudokuAppState extends ConsumerState<SudokuApp> {
  late final AppLifecycleObserver _observer;

  @override
  void initState() {
    super.initState();

    _observer = AppLifecycleObserver(ref);
    WidgetsBinding.instance.addObserver(_observer);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

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
              ),
            ],
          ),
          GoRoute(
            path: 'history',
            name: 'history',
            builder: (context, state) => HistoryScreen(),
          ),
        ],
      ),
    ],
  );
}
