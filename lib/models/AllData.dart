class AllData {
  Data result;
  String status;

  AllData({this.result, this.status});

  AllData.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Data.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<Assets> assets;
  List<Tasks> tasks;
  List<Workers> workers;

  Data({this.assets, this.tasks, this.workers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['assets'] != null) {
      assets = new List<Assets>();
      json['assets'].forEach((v) {
        assets.add(new Assets.fromJson(v));
      });
    }
    if (json['tasks'] != null) {
      tasks = new List<Tasks>();
      json['tasks'].forEach((v) {
        tasks.add(new Tasks.fromJson(v));
      });
    }
    if (json['workers'] != null) {
      workers = new List<Workers>();
      json['workers'].forEach((v) {
        workers.add(new Workers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assets != null) {
      data['assets'] = this.assets.map((v) => v.toJson()).toList();
    }
    if (this.tasks != null) {
      data['tasks'] = this.tasks.map((v) => v.toJson()).toList();
    }
    if (this.workers != null) {
      data['workers'] = this.workers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  int assetsId;
  String assetsName;

  Assets({this.assetsId, this.assetsName});

  Assets.fromJson(Map<String, dynamic> json) {
    assetsId = json['assets_id'];
    assetsName = json['assets_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assets_id'] = this.assetsId;
    data['assets_name'] = this.assetsName;
    return data;
  }
}

class Tasks {
  int taskId;
  String taskName;

  Tasks({this.taskId, this.taskName});

  Tasks.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskName = json['task_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['task_name'] = this.taskName;
    return data;
  }
}

class Workers {
  int workerId;
  String workerName;

  Workers({this.workerId, this.workerName});

  Workers.fromJson(Map<String, dynamic> json) {
    workerId = json['worker_id'];
    workerName = json['worker_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['worker_id'] = this.workerId;
    data['worker_name'] = this.workerName;
    return data;
  }
}