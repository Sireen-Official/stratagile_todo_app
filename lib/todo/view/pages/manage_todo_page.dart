import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/extensions/navigation_extension.dart';
import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';
import 'package:stratagile_todo_test/todo/controller/todo_provider.dart';
import 'package:stratagile_todo_test/todo/model/todo_model.dart';

enum ManageType {
  edit(text: "Edit"),
  create(text: "Create");

  final String text;
  const ManageType({required this.text});
}

class ManageTodoPage extends HookConsumerWidget {
  const ManageTodoPage({super.key, required this.manageType, this.todo});

  final ManageType manageType;
  final TodoModel? todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useTextEditingController();
    final description = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primaryContainer,
        surfaceTintColor: Colors.transparent,
        title: Text(manageType.text, style: context.typography.headline),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text("Title", style: context.typography.title),
            const SizedBox(height: 8),
            TextField(
              controller: title,
              decoration: InputDecoration(hintText: "Enter Todo Title"),
            ),
            const SizedBox(height: 16),
            Text("Description", style: context.typography.title),
            const SizedBox(height: 8),
            TextField(
              controller: description,
              decoration: InputDecoration(hintText: "Enter Todo Description"),
              maxLines: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (manageType == ManageType.edit) {
            ref
                .read(todoNotifierProvider.notifier)
                .updateTodo(
                  todo!.copyWith(
                    title: title.text,
                    description: description.text,
                  ),
                );
          } else {
            ref
                .read(todoNotifierProvider.notifier)
                .addTodo(
                  TodoModel(
                    title: title.text,
                    description: description.text,
                    createdAt: DateTime.now(),
                  ),
                );
          }
          context.pop();
        },
        label: Text(manageType.text, style: context.typography.button),
      ),
    );
  }
}
