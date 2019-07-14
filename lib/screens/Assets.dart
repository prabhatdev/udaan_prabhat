import 'package:flutter/material.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/common/viewmodel.dart';
import 'package:udaan_prabhat/models/Assets.dart';

class AssetsPage extends StatefulWidget {
  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  ViewModel viewModel=ViewModel();
  Future<AssetsModel> fetchAssets() async {
    AssetsModel assetsModel= await viewModel.getAllAssets();
    return assetsModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AssetsModel>(
      future: fetchAssets(),
      builder: (BuildContext context, AsyncSnapshot<AssetsModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          if(snapshot.hasError){
            return Utils.errorScreen((){
              setState(() {
              });
            });
          }
          AssetsModel response = snapshot.data;
          if (response.status == "ok") {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.album),
                  title: Text(response.result[index].assetName),
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
