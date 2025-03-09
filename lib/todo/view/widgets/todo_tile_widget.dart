import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/extensions/navigation_extension.dart';
import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';
import 'package:stratagile_todo_test/todo/controller/todo_provider.dart';
import 'package:stratagile_todo_test/todo/model/todo_model.dart';
import 'package:stratagile_todo_test/todo/view/pages/manage_todo_page.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});
  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          ref
              .read(todoNotifierProvider.notifier)
              .updateTodo(todo.copyWith(isCompleted: value ?? false));
        },
      ),
      title: Text("Todo title", style: context.typography.body),
      subtitle: Text("Todo subtitle", style: context.typography.body),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.push(
                ManageTodoPage(manageType: ManageType.edit, todo: todo),
              );
            },
            icon: Icon(Icons.edit, color: context.colorScheme.primary),
          ),
          IconButton(
            onPressed: () {
              ref.read(todoNotifierProvider.notifier).removeTodo(todo);
            },
            icon: Icon(Icons.delete, color: context.colorScheme.error),
          ),
        ],
      ),
    );
  }
}
