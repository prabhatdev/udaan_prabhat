import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/AllData.dart';
import 'package:udaan_prabhat/screens/Assets.dart';
import 'package:udaan_prabhat/screens/Tasks.dart';
import 'package:udaan_prabhat/screens/Workers.dart';
import 'package:unicorndial/unicorndial.dart';

import 'AllocateTasks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var viewModel = ViewModel();

  var assetsNameController = TextEditingController();
  var taskNameController = TextEditingController();
  var frequencyController = TextEditingController();
  var workerNameController = TextEditingController();
  var workerSkillsController = TextEditingController();
  var assetsNameFormKey = GlobalKey<FormState>();
  var taskNameFormKey = GlobalKey<FormState>();
  var workerFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Tasks selectedTask;

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Add Task",
      currentButton: FloatingActionButton(
        heroTag: 'Task',
        onPressed: () {
          Alert(
              style: AlertStyle(
                titleStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                descStyle:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
              ),
              context: context,
              title: "Add Task",
              content: Form(
                key: taskNameFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Task name';
                        }
                        return null;
                      },
                      controller: taskNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Task Name',
                      ),
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter frequency';
                        }
                        return null;
                      },
                      controller: frequencyController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Frequency',
                      ),
                    ),
                  ],
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    if (taskNameFormKey.currentState.validate()) {
                      viewModel
                          .addTask(
                              taskNameController.text, frequencyController.text)
                          .then((response) {
                        Navigator.pop(context);
                        scaffoldKey.currentState
                            .showSnackBar(Utils.getSnackBar(response.result));
                      });
                    }
                    taskNameController.text = "";
                    frequencyController.text = "";
                  },
                  child: Text(
                    "SEND",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        backgroundColor: Colors.grey,
        mini: true,
        child: Icon(Icons.add),
      ),
    ));
    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Add Assets",
      currentButton: FloatingActionButton(
        heroTag: 'Assets',
        onPressed: () {
          Alert(
              style: AlertStyle(
                titleStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                descStyle:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
              ),
              context: context,
              title: "Add Asset",
              content: Form(
                key: assetsNameFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter asset';
                        }
                        return null;
                      },
                      controller: assetsNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Assest Name',
                          hintText: "Chair, Floor, Table...etc "),
                    ),
                  ],
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    if (assetsNameFormKey.currentState.validate()) {
                      viewModel
                          .addAsset(assetsNameController.text)
                          .then((response) {
                        Navigator.pop(context);
                        scaffoldKey.currentState
                            .showSnackBar(Utils.getSnackBar(response.result));
                      });
                    }
                    assetsNameController.text = "";
                  },
                  child: Text(
                    "SEND",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        backgroundColor: Colors.grey,
        mini: true,
        child: Icon(Icons.add),
      ),
    ));
    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Add Worker",
      currentButton: FloatingActionButton(
        heroTag: 'Worker',
        onPressed: () {
          Alert(
              style: AlertStyle(
                titleStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                descStyle:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
              ),
              context: context,
              title: "Add Worker",
              content: Form(
                key: workerFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      controller: workerNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Worker Name',
                      ),
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter skills';
                        }
                        return null;
                      },
                      controller: workerSkillsController,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Skills',
                          hintText: 'Ex- Mopping, Cleaning, etc'),
                    ),
                  ],
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    if (workerFormKey.currentState.validate()) {
                      viewModel
                          .addWorker(workerNameController.text,
                              workerSkillsController.text)
                          .then((response) {
                        Navigator.pop(context);
                        scaffoldKey.currentState
                            .showSnackBar(Utils.getSnackBar(response.result));
                      });
                    }
                    workerNameController.text = "";
                    workerSkillsController.text = "";
                  },
                  child: Text(
                    "SEND",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        backgroundColor: Colors.grey,
        mini: true,
        child: Icon(Icons.add),
      ),
    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Allocate Task",
      currentButton: FloatingActionButton(
        heroTag: 'Allocate',
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext
          context)
          =>AllocateTasks()));
        },
        backgroundColor: Colors.grey,
        mini: true,
        child: Icon(Icons.add),
      ),
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('HouseKeeper'),
          bottom: TabBar(tabs: [
            Tab(text: "Tasks"),
            Tab(text: "Workers"),
            Tab(
              text: "Assets",
            )
          ]),
        ),
        body: TabBarView(children: [
          TasksPage(),
          WorkersPage(),
          AssetsPage()
        ]),
      ),
    );
  }
}
