import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';
import 'package:stratagile_todo_test/core/theme/theme.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: context.colorScheme.primaryContainer,
            brightness: context.theme.brightness,
            largeTitle: Text(
              "Settings",
              style: context.typography.headline.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          SliverMainAxisGroup(
            slivers: [
              SliverAppBar(
                primary: false,
                pinned: true,
                title: Text("Theme", style: context.typography.title),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _buildSelectThemeTile(
                        context,
                        ref,
                        theme: ThemeMode.light,
                      ),
                      _buildSelectThemeTile(
                        context,
                        ref,
                        theme: ThemeMode.dark,
                      ),
                      _buildSelectThemeTile(
                        context,
                        ref,
                        theme: ThemeMode.system,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile _buildSelectThemeTile(
    BuildContext context,
    WidgetRef ref, {
    required ThemeMode theme,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(switch (theme) {
        ThemeMode.system => 'System',

        ThemeMode.light => 'Light',

        ThemeMode.dark => 'Dark',
      }, style: context.typography.body),
      trailing: Switch(
        value: ref.watch(themeNotifierProvider).themeMode == theme,
        onChanged:
            (_) => ref.read(themeNotifierProvider.notifier).changeTheme(theme),
      ),
    );
  }
}
