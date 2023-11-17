class Status {
  Status({
      this.timestamp, 
      this.errorCode, 
      this.errorMessage, 
      this.elapsed, 
      this.creditCount,});

  Status.fromJson(dynamic json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }
  String? timestamp;
  String? errorCode;
  String? errorMessage;
  String? elapsed;
  int? creditCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['error_code'] = errorCode;
    map['error_message'] = errorMessage;
    map['elapsed'] = elapsed;
    map['credit_count'] = creditCount;
    return map;
  }

}