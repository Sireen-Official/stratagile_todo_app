import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stratagile_todo_test/todo/model/todo_model.dart';

part 'todo_provider.freezed.dart';
part 'todo_provider.g.dart';

enum TodoFilter { all, pending, completed }

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    required List<TodoModel> todos,
    required TodoFilter filter,
  }) = _TodoState;
}

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  TodoState build() {
    return const TodoState(todos: [], filter: TodoFilter.all);
  }

  void addTodo(TodoModel todo) {
    state = state.copyWith(todos: [...state.todos, todo]);
  }

  void removeTodo(TodoModel todo) {
    state = state.copyWith(
      todos: [
        for (final todo in state.todos)
          if (todo.createdAt != todo.createdAt) todo,
      ],
    );
  }

  void updateTodo(TodoModel todo) {
    state = state.copyWith(
      todos:
          state.todos
              .map((e) => e.createdAt == todo.createdAt ? todo : e)
              .toList(),
    );
  }

  void changeFilter(TodoFilter filter) {
    state = state.copyWith(filter: filter);
  }
}

@riverpod
List<TodoModel> pendingTodos(Ref ref) {
  final todos = ref.watch(todoNotifierProvider).todos;

  return todos.where((todo) => !todo.isCompleted).toList();
}

@riverpod
List<TodoModel> completedTodos(Ref ref) {
  final todos = ref.watch(todoNotifierProvider).todos;

  return todos.where((todo) => todo.isCompleted).toList();
}
