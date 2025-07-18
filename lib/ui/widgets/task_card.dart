import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';

enum TaskType { tNew, progress, completed, cancelled }

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final TaskType taskType;

  const TaskCard({
    super.key,
    required this.taskModel,
    required this.taskType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.black),
            ),
            Text(
              taskModel.description,
              style: TextStyle(color: Colors.black45),
            ),
            Text(
              "Date: ${taskModel.createdDate}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(taskModel.status, style: TextStyle(color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor: _getTaskChipColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_calendar, color: Colors.greenAccent),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTaskChipColor() {
    switch (taskType) {
      case TaskType.tNew:
        return Colors.lightBlueAccent;
      case TaskType.progress:
        return Colors.purpleAccent;
      case TaskType.completed:
        return Colors.green;
      case TaskType.cancelled:
        return Colors.red;
    }
  }

  String _getTaskTypeName() {
    switch (taskType) {
      case TaskType.tNew:
        return 'New';
      case TaskType.progress:
        return 'Progress';
      case TaskType.completed:
        return 'Completed';
      case TaskType.cancelled:
        return 'Cancelled';
    }
  }
}
