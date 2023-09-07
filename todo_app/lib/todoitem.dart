import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset(
                    "lib/assets/images/kategori_1.png",
                    width: 40,
                    height: 40,
                  )
                : widget.task.type == TaskType.contest
                    ? Image.asset(
                        "lib/assets/images/kategori_3.png",
                        width: 40,
                        height: 40,
                      )
                    : Image.asset(
                        "lib/assets/images/kategori_2.png",
                        width: 40,
                        height: 40,
                      ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  },
                )
              },
            )
          ],
        ),
      ),
    );
  }
}
