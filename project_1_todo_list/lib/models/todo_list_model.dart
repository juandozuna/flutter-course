import 'package:equatable/equatable.dart';

class TodoListModel extends Equatable {
  final String item;

  const TodoListModel({
    required this.item,
  });

  @override
  List<Object> get props => [item];

  @override
  bool get stringify => true;
}
