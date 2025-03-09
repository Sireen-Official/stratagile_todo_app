import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/theme/theme.dart';
import 'package:stratagile_todo_test/navigation_panel/view/pages/navigation_panel_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(themeNotifierProvider).theme.light(),
      darkTheme: ref.watch(themeNotifierProvider).theme.dark(),
      themeMode: ref.watch(themeNotifierProvider).themeMode,
      debugShowCheckedModeBanner: false,
      home: NavigationPanelPage(),
    );
  }
}
