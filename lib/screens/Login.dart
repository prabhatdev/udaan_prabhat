import 'package:flutter/material.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';

import 'Home.dart';
import 'WorkerTask.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ViewModel viewModel = ViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.home,
                size: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Organisation ID",
                      hintText: "Don't have it? Ask your organisation"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  viewModel.verifyId(controller.text).then((response) {
                    if (response.status == "ok") {
                      if (response.result == "admin") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                      } else if (response.result == "worker") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WorkerTaskPage(
                                      workerid: controller.text,
                                    )));
                      }
                    } else {
                      _scaffoldKey.currentState
                          .showSnackBar(Utils.getSnackBar(response.result));
                    }
                  });
                },
              ),
              Text(
                "Id- 01234 for admin login",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
