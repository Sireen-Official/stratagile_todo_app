import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';
import 'package:stratagile_todo_test/navigation_panel/controller/navigation_panel_provider.dart';
import 'package:stratagile_todo_test/settings/view/pages/settings_page.dart';
import 'package:stratagile_todo_test/todo/view/pages/todo_page.dart';

class NavigationPanelPage extends ConsumerWidget {
  const NavigationPanelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: ref.watch(navigationPanelNotifierProvider).pageController,
        onPageChanged:
            (value) => ref
                .read(navigationPanelNotifierProvider.notifier)
                .onPageChanged(value),
        children: [TodoPage(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          ref.read(navigationPanelNotifierProvider.notifier).onPanelTap(value);
        },
        currentIndex: ref.watch(navigationPanelNotifierProvider).index,

        backgroundColor: context.colorScheme.primaryContainer,
        selectedLabelStyle: context.typography.label,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: "TODOS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: "SETTINGS",
          ),
        ],
      ),
    );
  }
}
