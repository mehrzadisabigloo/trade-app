class Quotes {
  Quotes({
      this.name, 
      this.price, 
      this.volume24h, 
      this.volume7d, 
      this.volume30d, 
      this.marketCap, 
      this.selfReportedMarketCap, 
      this.percentChange1h, 
      this.percentChange24h, 
      this.percentChange7d, 
      this.lastUpdated, 
      this.percentChange30d, 
      this.percentChange60d, 
      this.percentChange90d, 
      this.fullyDilluttedMarketCap, 
      this.marketCapByTotalSupply, 
      this.dominance, 
      this.turnover, 
      this.ytdPriceChangePercentage, 
      this.percentChange1y,});

  Quotes.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    volume24h = json['volume24h'];
    volume7d = json['volume7d'];
    volume30d = json['volume30d'];
    marketCap = json['marketCap'];
    selfReportedMarketCap = json['selfReportedMarketCap'];
    percentChange1h = json['percentChange1h'];
    percentChange24h = json['percentChange24h'];
    percentChange7d = json['percentChange7d'];
    lastUpdated = json['lastUpdated'];
    percentChange30d = json['percentChange30d'];
    percentChange60d = json['percentChange60d'];
    percentChange90d = json['percentChange90d'];
    fullyDilluttedMarketCap = json['fullyDilluttedMarketCap'];
    marketCapByTotalSupply = json['marketCapByTotalSupply'];
    dominance = json['dominance'];
    turnover = json['turnover'];
    ytdPriceChangePercentage = json['ytdPriceChangePercentage'];
    percentChange1y = json['percentChange1y'];
  }
  String? name;
  double? price;
  double? volume24h;
  double? volume7d;
  double? volume30d;
  double? marketCap;
  double? selfReportedMarketCap;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  String? lastUpdated;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? fullyDilluttedMarketCap;
  double? marketCapByTotalSupply;
  double? dominance;
  double? turnover;
  double? ytdPriceChangePercentage;
  double? percentChange1y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['volume24h'] = volume24h;
    map['volume7d'] = volume7d;
    map['volume30d'] = volume30d;
    map['marketCap'] = marketCap;
    map['selfReportedMarketCap'] = selfReportedMarketCap;
    map['percentChange1h'] = percentChange1h;
    map['percentChange24h'] = percentChange24h;
    map['percentChange7d'] = percentChange7d;
    map['lastUpdated'] = lastUpdated;
    map['percentChange30d'] = percentChange30d;
    map['percentChange60d'] = percentChange60d;
    map['percentChange90d'] = percentChange90d;
    map['fullyDilluttedMarketCap'] = fullyDilluttedMarketCap;
    map['marketCapByTotalSupply'] = marketCapByTotalSupply;
    map['dominance'] = dominance;
    map['turnover'] = turnover;
    map['ytdPriceChangePercentage'] = ytdPriceChangePercentage;
    map['percentChange1y'] = percentChange1y;
    return map;
  }

}