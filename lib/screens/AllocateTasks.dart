import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/AllData.dart';
import 'package:udaan_prabhat/models/AllocatedTaskDetails.dart';
import 'package:udaan_prabhat/models/GenericResponse.dart';

class AllocateTasks extends StatefulWidget {
  @override
  _AllocateTasksState createState() => _AllocateTasksState();
}

class _AllocateTasksState extends State<AllocateTasks> {
//  var scaffoldKey = GlobalKey<ScaffoldState>();

  var viewModel = ViewModel();

  Future<AllData> fetchTasks() async {
    AllData allData = await viewModel.getAll();
    return allData;
  }

  Tasks selectedTask;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) {
        return AllocatedTasksDetails();
      },
      child: Scaffold(
//        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Allocate Tasks'),
        ),
        body: FutureBuilder<AllData>(
          future: fetchTasks(),
          builder: (BuildContext context, AsyncSnapshot<AllData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              AllData response = snapshot.data;
              if (response.status == "ok") {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Select tasks",
                      style: TextStyle(fontSize: 25),
                    ),
                    TaskChoiceChip(
                      tasks: response.result.tasks,
                    ),
                    Text(
                      "Select assets",
                      style: TextStyle(fontSize: 25),
                    ),
                    AssetChoiceChip(
                      assets: response.result.assets,
                    ),
                    Text(
                      "Select worker",
                      style: TextStyle(fontSize: 25),
                    ),
                    WorkersChoiceChip(
                      workers: response.result.workers,
                    ),
                    SelectDays()
                  ],
                );
              } else {
                return Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text("Hey there! Looks like our overpaid "
                              "engineers messed up!-Poor Interns\n Tap to retry"),
                        )));
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
                ),
              );
            }
          },
        ),
        bottomSheet: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.indigoAccent,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: NextButton(viewModel),
              ),
            )),
      ),
    );
  }
}

class TaskChoiceChip extends StatefulWidget {
  List<Tasks> tasks;

  TaskChoiceChip({this.tasks});

  @override
  _TaskChoiceChipState createState() => _TaskChoiceChipState();
}

class _TaskChoiceChipState extends State<TaskChoiceChip> {
  Tasks selectedChoice = Tasks();
  AllocatedTasksDetails tasksInfo;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.tasks.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item.taskName),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Color(0xffffc107),
          selected: selectedChoice.taskId == item.taskId,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              tasksInfo.taskId = item.taskId.toString();
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    tasksInfo = Provider.of<AllocatedTasksDetails>(context);
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class AssetChoiceChip extends StatefulWidget {
  List<Assets> assets;

  AssetChoiceChip({this.assets});

  @override
  _AssetChoiceChipState createState() => _AssetChoiceChipState();
}

class _AssetChoiceChipState extends State<AssetChoiceChip> {
  Assets selectedChoice = Assets();

  AllocatedTasksDetails tasksInfo;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.assets.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item.assetsName),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Color(0xffffc107),
          selected: selectedChoice.assetsName == item.assetsName,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              tasksInfo.assetId = item.assetsId.toString();
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    tasksInfo = Provider.of<AllocatedTasksDetails>(context);

    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class WorkersChoiceChip extends StatefulWidget {
  List<Workers> workers;

  WorkersChoiceChip({this.workers});

  @override
  _WorkersChoiceChipState createState() => _WorkersChoiceChipState();
}

class _WorkersChoiceChipState extends State<WorkersChoiceChip> {
  Workers selectedChoice = Workers();

  AllocatedTasksDetails tasksInfo;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.workers.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item.workerName),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Color(0xffffc107),
          selected: selectedChoice.workerId == item.workerId,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              tasksInfo.workerId = item.workerId.toString();
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    tasksInfo = Provider.of<AllocatedTasksDetails>(context);
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class SelectDays extends StatefulWidget {
  @override
  _SelectDaysState createState() => _SelectDaysState();
}

class _SelectDaysState extends State<SelectDays> {
  AllocatedTasksDetails tasksInfo;

  @override
  Widget build(BuildContext context) {
    tasksInfo = Provider.of<AllocatedTasksDetails>(context);

    return Row(
      children: <Widget>[
        Text("Completion time: "),
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
            setState(() {
              tasksInfo.days++;
            });
          },
        ),
        Text(tasksInfo.days.toString()),
        IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () {
            setState(() {
              (tasksInfo.days > 1) ? tasksInfo.days-- : tasksInfo.days = 0;
            });
          },
        )
      ],
    );
  }
}

class NextButton extends StatefulWidget {
  ViewModel viewModel;

  NextButton(this.viewModel);

  @override
  State<StatefulWidget> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  Future<GenericResponse> postTask(
      String assetId, String workerId, String taskId, int days) async {
    DateTime now = DateTime.now();

    String stime = now.millisecondsSinceEpoch.toString();
    now.add(Duration(days: days));
    String etime = (now.millisecondsSinceEpoch+(1000*60*60*24)*days).toString();
    Map payload = {
      "task_id": taskId,
      "asset_id": assetId,
      "worker_id": workerId,
      "time_of_allocation": stime,
      "taskToBePerformedBy": etime
    };
    return await widget.viewModel.allocateTask(payload).then((response) {
      return response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasksInfo = Provider.of<AllocatedTasksDetails>(context);
    return RaisedButton(
      onPressed: () {
        postTask(tasksInfo.assetId, tasksInfo.workerId, tasksInfo.taskId,
                tasksInfo.days)
            .then((reply) {
          setState(() {
            if (reply.status == "ok") {
              Navigator.pop(context);
            } else {
              Utils.showToast(reply.result);
            }
          });
        });
      },
      child: Text("Next"),
      color: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    );
  }
}
