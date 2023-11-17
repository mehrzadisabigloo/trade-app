import 'CryptoCurrencyList.dart';

class Data {
  Data({
      this.cryptoCurrencyList, 
      this.totalCount,});

  Data.fromJson(dynamic json) {
    if (json['cryptoCurrencyList'] != null) {
      cryptoCurrencyList = [];
      json['cryptoCurrencyList'].forEach((v) {
        cryptoCurrencyList?.add(CryptoCurrencyList.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }
  List<CryptoCurrencyList>? cryptoCurrencyList;
  String? totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final cryptoCurrencyList = this.cryptoCurrencyList;
    if (cryptoCurrencyList != null) {
      map['cryptoCurrencyList'] = cryptoCurrencyList.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = totalCount;
    return map;
  }

}