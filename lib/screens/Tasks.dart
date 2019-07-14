import 'package:flutter/material.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/TasksModel.dart';
import 'package:udaan_prabhat/widgets/OnGoingTasks.dart';
import 'package:udaan_prabhat/common/Utils.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  ViewModel viewModel = ViewModel();

  Future<TasksModel> fetchTasks() async {
    TasksModel tasksModel = await viewModel.getOnGOingTasks();
    return tasksModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TasksModel>(
      future: fetchTasks(),
      builder: (BuildContext context, AsyncSnapshot<TasksModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          if(snapshot.hasError){
            return Utils.errorScreen(setState);
          }
          TasksModel response = snapshot.data;
          if (response.status == "ok") {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return OnGoingTasks(task: response.result[index]);
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
    );
  }
}
