import 'package:flutter/material.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/Workers.dart';
class WorkersPage extends StatefulWidget {
  @override
  _WorkersPageState createState() => _WorkersPageState();
}

class _WorkersPageState extends State<WorkersPage> {

  ViewModel viewModel=ViewModel();

  Future<WorkerModel> fetchTasks() async {
    WorkerModel workerModel = await viewModel.getAllWorkers();
    return workerModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WorkerModel>(
      future: fetchTasks(),
      builder: (BuildContext context, AsyncSnapshot<WorkerModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          if(snapshot.hasError){
            return Utils.errorScreen(setState);
          }
          WorkerModel response = snapshot.data;
          if (response.status == "ok") {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(response.result[index].workerName),
                  subtitle:Text(response.result[index].skills) ,
                );
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
