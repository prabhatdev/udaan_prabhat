import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udaan_prabhat/models/TasksModel.dart';

class OnGoingTasks extends StatelessWidget {
  Task task;

  OnGoingTasks({this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(task.taskName,style: TextStyle(fontSize: 25),),
              isThreeLine: true,
              subtitle: Text("${task.assetName} by -${task.workerName} \n"
                  "Added on ${DateFormat("yyyy-MM-dd hh:mm").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      int.parse(task.allocationTime)))} \nCompletion Date ${DateFormat("yyyy-MM-dd hh:mm").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      int.parse(task.toBeCompleted)))}",style: TextStyle
                (fontSize: 15),),
              trailing: (DateTime.now().millisecondsSinceEpoch>int.parse(task
                  .toBeCompleted))?Icon(Icons.check_circle,color: Colors
                  .green,):Icon(Icons.close),


            )
          ],
        ),
      ),
    );
  }
}
