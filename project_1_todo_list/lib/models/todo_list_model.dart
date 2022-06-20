import 'package:equatable/equatable.dart';

class TodoListModel extends Equatable {
  final String item;
  final bool isDone;

  const TodoListModel({
    required this.item,
    required this.isDone,
  });

  @override
  List<Object> get props => [item];

  @override
  bool get stringify => true;
}
