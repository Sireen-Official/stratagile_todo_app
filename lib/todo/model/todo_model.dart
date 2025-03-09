import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required DateTime createdAt,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _TodoModel;
}
