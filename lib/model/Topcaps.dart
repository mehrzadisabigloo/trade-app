import 'Data.dart';
import 'Status.dart';

class TopCaps {
  TopCaps({
      this.data, 
      this.status,});

  TopCaps.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Data? data;
  Status? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final data = this.data;
    if (data != null) {
      map['data'] = data.toJson();
    }
    final status = this.status;
    if (status != null) {
      map['status'] = status.toJson();
    }
    return map;
  }

}