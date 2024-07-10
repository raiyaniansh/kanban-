import 'package:get/get.dart';

import '../../task/model/comment_model.dart';

class TodoModel {
  final String title;
  final String description;
  final DateTime dateTime;
  final RxList<CommentModel> commentList;

  TodoModel({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.commentList,
  });
}
