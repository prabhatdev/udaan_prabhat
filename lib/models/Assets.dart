class AssetsModel {
  List<Asset> result;
  String status;

  AssetsModel({this.result, this.status});

  AssetsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Asset>();
      json['result'].forEach((v) {
        result.add(new Asset.fromJson(v));
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

class Asset {
  int assetId;
  String assetName;

  Asset({this.assetId, this.assetName});

  Asset.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    assetName = json['asset_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset_id'] = this.assetId;
    data['asset_name'] = this.assetName;
    return data;
  }
}