import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:udaan_prabhat/common/Utils.dart';
import 'package:udaan_prabhat/models/AllData.dart';
import 'package:udaan_prabhat/models/Assets.dart';
import 'package:udaan_prabhat/models/GenericResponse.dart';
import 'package:udaan_prabhat/models/TasksModel.dart';
import 'package:udaan_prabhat/models/Workers.dart';

class ViewModel {
  final String baseUrl = "http://13.127.203.238/";

  Future<TasksModel> getOnGOingTasks() async {
    String url = baseUrl + "on_going_tasks";
    Response response = await get(url);
    if (response.statusCode != 200 && response.statusCode != 201) {
      Utils.showToast("Unknown Error Occurres ${response.statusCode}");
    }
    String reply = response.body;
    var tasks = TasksModel.fromJson(jsonDecode(reply));
    return tasks;
  }

  Future<TasksModel> getWorkerTask(String id) async {
    String url = baseUrl + "get-tasks-for-worker/${id}";
    Response response = await get(url);
    if (response.statusCode != 200 && response.statusCode != 201) {
      Utils.showToast("Unknown Error Occurres ${response.statusCode}");
    }
    String reply = response.body;
    var tasks = TasksModel.fromJson(jsonDecode(reply));
    return tasks;
  }

  Future<AllData> getAll() async {
    String url = baseUrl + "getAll";
    Response response = await get(url);
    if (response.statusCode != 200 && response.statusCode != 201) {
      Utils.showToast("Unknown Error Occurres ${response.statusCode}");
    }
    String reply = response.body;
    var data = AllData.fromJson(jsonDecode(reply));
    return data;
  }


  Future<WorkerModel> getAllWorkers() async {
    String url = baseUrl + "get-workers";
    Response response = await get(url);
    if (response.statusCode != 200 && response.statusCode != 201) {
      Utils.showToast("Unknown Error Occurres ${response.statusCode}");
    }
    String reply = response.body;
    var data = WorkerModel.fromJson(jsonDecode(reply));
    return data;
  }
  Future<AssetsModel> getAllAssets() async {
    String url = baseUrl + "assets/all";
    Response response = await get(url);
    if (response.statusCode != 200 && response.statusCode != 201) {
      Utils.showToast("Unknown Error Occurres ${response.statusCode}");
    }
    String reply = response.body;
    var data = AssetsModel.fromJson(jsonDecode(reply));
    return data;
  }



  Future<GenericResponse> addAsset(String name) async {
    String url = baseUrl + "add-asset";
    Map body = Map();
    body['asset_name'] = name;
    var response = await post(url, body: body);
    if (response.statusCode != 200 && response.statusCode != 201)
      Utils.showToast("Some Error Occurred-${response.statusCode.toString()}");
    String reply = await response.body;
    return GenericResponse.fromJson(json.decode(reply));
  }

  Future<GenericResponse> verifyId(String id) async {
    String url = baseUrl + "verify/id";
    Map body = Map();
    body['employee_id'] = id;
    var response = await post(url, body: body);
    if (response.statusCode != 200 && response.statusCode != 201)
      Utils.showToast("Some Error Occurred-${response.statusCode.toString()}");
    String reply = await response.body;
    return GenericResponse.fromJson(json.decode(reply));
  }

  Future<GenericResponse> addWorker(String name, String skills) async {
    String url = baseUrl + "add-worker";
    Map body = Map();
    body['worker_name'] = name;
    body['skills'] = skills;
    var response = await post(url, body: body);
    if (response.statusCode != 200 && response.statusCode != 201)
      Utils.showToast("Some Error Occurred-${response.statusCode.toString()}");
    String reply = await response.body;
    return GenericResponse.fromJson(json.decode(reply));
  }

  Future<GenericResponse> addTask(String name, String freq) async {
    String url = baseUrl + "add-task";
    Map body = Map();
    body['task_name'] = name;
    body['task_frequency'] = freq;
    var response = await post(url, body: body);
    if (response.statusCode != 200 && response.statusCode != 201)
      Utils.showToast("Some Error Occurred-${response.statusCode.toString()}");
    String reply = await response.body;
    return GenericResponse.fromJson(json.decode(reply));
  }

  Future<GenericResponse> allocateTask(Map body) async {
    String url = baseUrl + "allocatetask";
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response =
        await request.close().timeout(Duration(seconds: 3));
    if (response.statusCode != 200 && response.statusCode != 201)
      Utils.showToast("Some Error Occurred-" + response.statusCode.toString());
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    var result = GenericResponse.fromJson(jsonDecode(reply));
    return result;
  }


}
