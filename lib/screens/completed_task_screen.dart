import 'package:api_getx/data/models/task_list_models.dart';
import 'package:api_getx/data/models/task_models.dart';
import 'package:api_getx/data/services/network_client.dart';
import 'package:api_getx/utils/urls.dart';
import 'package:api_getx/widgets/center_circular_progress_indicator.dart';
import 'package:api_getx/widgets/snackbar_massage.dart';
import 'package:api_getx/widgets/task_card.dart';
import 'package:flutter/material.dart';


class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompletedTasksInProgress = false;
  List<TaskModel> _completedTaskList = [];

  @override
  void initState() {
    super.initState();
    _getAllCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getCompletedTasksInProgress == false,
        replacement: const CenteredCircularProgressIndicator(),
        child: ListView.separated(
          itemCount: _completedTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskStatus: TaskStatus.completed,
              taskModel: _completedTaskList[index],
              refreshList: _getAllCompletedTaskList,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Future<void> _getAllCompletedTaskList() async {
    _getCompletedTasksInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkClient.getRequest(url: Urls.completedTaskListUrl);
    if (response.isSuccess) {
      TaskListModel taskListModel = TaskListModel.fromJson(response.data ?? {});
      _completedTaskList = taskListModel.taskList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }

    _getCompletedTasksInProgress = false;
    setState(() {});
  }
}