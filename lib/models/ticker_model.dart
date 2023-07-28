class TickerModel {
  String name;
  String symbol;
  bool hasIntraday;
  bool hasEod;
  String? country;

  TickerModel(
      {required this.name,
        required this.symbol,
        required this.hasIntraday,
        required this.hasEod,
         this.country,});

  factory TickerModel.fromJson(Map<String, dynamic> json) {
    return TickerModel(
        name: json['name'],
        symbol: json['symbol'],
        hasIntraday: json['has_intraday'],
    hasEod:  json['has_eod'],
    country: json['country'],
    );
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['has_intraday'] = this.hasIntraday;
    data['has_eod'] = this.hasEod;
    data['country'] = this.country;

    return data;
  }
}

class StockExchange {
  String name;
  String acronym;
  String mic;
  String country;
  String countryCode;
  String city;
  String website;

  StockExchange(
      {required this.name,
        required this.acronym,
        required this.mic,
        required this.country,
        required this.countryCode,
        required this.city,
        required this.website});

 factory StockExchange.fromJson(Map<String, dynamic> json) {
   return StockExchange(
       name: json['name'],
       acronym: json['acronym'],
       mic: json['mic'],
   country: json['country'],
   countryCode:json['country_code'],
   city: json['city'],
   website: json['website']
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['acronym'] = this.acronym;
    data['mic'] = this.mic;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city'] = this.city;
    data['website'] = this.website;
    return data;
  }
}
