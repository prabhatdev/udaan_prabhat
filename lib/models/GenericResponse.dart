class GenericResponse {
  String result;
  String status;

  GenericResponse({this.result, this.status});

  GenericResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['status'] = this.status;
    return data;
  }
}
