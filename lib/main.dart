import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/app.dart';

void main() {
  runApp(ProviderScope(child: const App()));
}
