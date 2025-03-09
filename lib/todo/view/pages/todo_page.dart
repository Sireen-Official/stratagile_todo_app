import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stratagile_todo_test/core/extensions/navigation_extension.dart';
import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';
import 'package:stratagile_todo_test/todo/controller/todo_provider.dart';
import 'package:stratagile_todo_test/todo/view/pages/manage_todo_page.dart';
import 'package:stratagile_todo_test/todo/view/widgets/widgets.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingTodos = ref.watch(pendingTodosProvider);
    final completedTodos = ref.watch(completedTodosProvider);
    final todoState = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primaryContainer,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "My Todo List",
          style: context.typography.headline.copyWith(
            color: context.colorScheme.onPrimaryContainer,
          ),
        ),
        actions: [
          PopupMenuButton<TodoFilter>(
            icon: const Icon(Icons.filter_list_rounded),
            itemBuilder:
                (context) =>
                    TodoFilter.values
                        .map(
                          (filter) => PopupMenuItem<TodoFilter>(
                            value: filter,
                            child: Text(filter.name),
                          ),
                        )
                        .toList(),
            onSelected:
                (value) =>
                    ref.read(todoNotifierProvider.notifier).changeFilter(value),
          ),
        ],
      ),
      body:
          todoState.todos.isEmpty
              ? Center(child: Text("Add a todo"))
              : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TodoOverviewCard(
                      pendingCount: pendingTodos.length,
                      completedCount: completedTodos.length,
                    ),
                  ),

                  pendingTodos.isNotEmpty &&
                          (todoState.filter == TodoFilter.pending ||
                              todoState.filter == TodoFilter.all)
                      ? SliverMainAxisGroup(
                        slivers: [
                          SliverAppBar(
                            primary: false,
                            pinned: true,
                            title: Text("Pending"),
                            surfaceTintColor: Colors.transparent,
                            titleTextStyle: context.typography.title,
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: SliverList.builder(
                              itemCount: pendingTodos.length,
                              itemBuilder:
                                  (context, index) =>
                                      TodoTile(todo: pendingTodos[index]),
                            ),
                          ),
                        ],
                      )
                      : SliverToBoxAdapter(),
                  completedTodos.isNotEmpty &&
                          (todoState.filter == TodoFilter.completed ||
                              todoState.filter == TodoFilter.all)
                      ? SliverMainAxisGroup(
                        slivers: [
                          SliverAppBar(
                            primary: false,
                            pinned: true,
                            backgroundColor: Colors.transparent,
                            title: Text("Completed"),
                            titleTextStyle: context.typography.title,
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: SliverList.builder(
                              itemCount: completedTodos.length,
                              itemBuilder:
                                  (context, index) =>
                                      TodoTile(todo: completedTodos[index]),
                            ),
                          ),
                        ],
                      )
                      : SliverToBoxAdapter(),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ManageTodoPage(manageType: ManageType.create));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
