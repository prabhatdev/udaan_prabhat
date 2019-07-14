import 'package:flutter/material.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/TasksModel.dart';
import 'package:udaan_prabhat/widgets/OnGoingWorkerTask.dart';

class WorkerTaskPage extends StatefulWidget {
  String workerid = "";

  WorkerTaskPage({this.workerid});

  @override
  _WorkerTaskPageState createState() => _WorkerTaskPageState();
}

class _WorkerTaskPageState extends State<WorkerTaskPage> {
  ViewModel viewModel = ViewModel();

  Future<TasksModel> fetchTasks(String id) async {
    TasksModel tasksModel = await viewModel.getWorkerTask(id);
    return tasksModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Tasks"),
      ),
      body: FutureBuilder<TasksModel>(
        future: fetchTasks(widget.workerid),
        builder: (BuildContext context, AsyncSnapshot<TasksModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Utils.errorScreen(() {
                setState(() {});
              });
            }
            TasksModel response = snapshot.data;
            if (response.status == "ok") {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return OnGoingWorkerTasks(task: response.result[index]);
                },
                itemCount: response.result.length,
              );
            } else {
              return Utils.errorScreen(setState);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
              ),
            );
          }
        },
      ),
    );
  }
}
