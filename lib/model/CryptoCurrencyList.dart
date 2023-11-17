import 'Quotes.dart';

class CryptoCurrencyList {
  CryptoCurrencyList({
      this.id,
      this.name,
      this.symbol,
      this.slug,
      this.cmcRank,
      this.marketPairCount,
      this.circulatingSupply,
      this.selfReportedCirculatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.atl,
      this.high24h,
      this.low24h,
      this.isActive,
      this.lastUpdated,
      this.dateAdded,
      this.quotes,
      this.isAudited,});

  CryptoCurrencyList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmcRank'];
    marketPairCount = json['marketPairCount'];
    circulatingSupply = json['circulatingSupply'];
    selfReportedCirculatingSupply = json['selfReportedCirculatingSupply'];
    totalSupply = json['totalSupply'];
    maxSupply = json['maxSupply'];
    ath = json['ath'];
    atl = json['atl'];
    high24h = json['high24h'];
    low24h = json['low24h'];
    isActive = json['isActive'];
    lastUpdated = json['lastUpdated'];
    dateAdded = json['dateAdded'];
    if (json['quotes'] != null) {
      quotes = [];
      json['quotes'].forEach((v) {
        quotes?.add(Quotes.fromJson(v));
      });
    }
    isAudited = json['isAudited'];
  }
  dynamic? id;
  String? name;
  String? symbol;
  String? slug;
  dynamic? cmcRank;
  dynamic? marketPairCount;
  double? circulatingSupply;
  dynamic? selfReportedCirculatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? atl;
  double? high24h;
  double? low24h;
  dynamic? isActive;
  String? lastUpdated;
  String? dateAdded;
  List<Quotes>? quotes;
  bool? isAudited;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['symbol'] = symbol;
    map['slug'] = slug;
    map['cmcRank'] = cmcRank;
    map['marketPairCount'] = marketPairCount;
    map['circulatingSupply'] = circulatingSupply;
    map['selfReportedCirculatingSupply'] = selfReportedCirculatingSupply;
    map['totalSupply'] = totalSupply;
    map['maxSupply'] = maxSupply;
    map['ath'] = ath;
    map['atl'] = atl;
    map['high24h'] = high24h;
    map['low24h'] = low24h;
    map['isActive'] = isActive;
    map['lastUpdated'] = lastUpdated;
    map['dateAdded'] = dateAdded;
    final quotes = this.quotes;
    if (quotes != null) {
      map['quotes'] = quotes.map((v) => v.toJson()).toList();
    }
    map['isAudited'] = isAudited;
    return map;
  }

}