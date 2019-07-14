class TasksModel {
  List<Task> result;
  String status;

  TasksModel({this.result, this.status});

  TasksModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Task>();
      json['result'].forEach((v) {
        result.add(new Task.fromJson(v));
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

class Task {
  String allocationTime;
  int assetId;
  String assetName;
  int onGoingTaskId;
  String skills;
  String taskFrequency;
  int taskId;
  String taskName;
  String toBeCompleted;
  String workerId;
  String workerName;

  Task(
      {this.allocationTime,
        this.assetId,
        this.assetName,
        this.onGoingTaskId,
        this.skills,
        this.taskFrequency,
        this.taskId,
        this.taskName,
        this.toBeCompleted,
        this.workerId,
        this.workerName});

  Task.fromJson(Map<String, dynamic> json) {
    allocationTime = json['allocation_time'];
    assetId = json['asset_id'];
    assetName = json['asset_name'];
    onGoingTaskId = json['on_going_task_id'];
    skills = json['skills'];
    taskFrequency = json['task_frequency'];
    taskId = json['task_id'];
    taskName = json['task_name'];
    toBeCompleted = json['to_be_completed'];
    workerId = json['worker_id'];
    workerName = json['worker_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allocation_time'] = this.allocationTime;
    data['asset_id'] = this.assetId;
    data['asset_name'] = this.assetName;
    data['on_going_task_id'] = this.onGoingTaskId;
    data['skills'] = this.skills;
    data['task_frequency'] = this.taskFrequency;
    data['task_id'] = this.taskId;
    data['task_name'] = this.taskName;
    data['to_be_completed'] = this.toBeCompleted;
    data['worker_id'] = this.workerId;
    data['worker_name'] = this.workerName;
    return data;
  }
}