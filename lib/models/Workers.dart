class WorkerModel {
  List<Worker> result;
  String status;

  WorkerModel({this.result, this.status});

  WorkerModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Worker>();
      json['result'].forEach((v) {
        result.add(new Worker.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Worker {
  String skills;
  int workerId;
  String workerName;

  Worker({this.skills, this.workerId, this.workerName});

  Worker.fromJson(Map<String, dynamic> json) {
    skills = json['skills'];
    workerId = json['worker_id'];
    workerName = json['worker_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skills'] = this.skills;
    data['worker_id'] = this.workerId;
    data['worker_name'] = this.workerName;
    return data;
  }
}