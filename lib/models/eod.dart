class EndOfDayModel {
  double open;
  double high;
  double low;
  double close;
  double volume;
  double adjHigh;
  double adjLow;
  double adjClose;
  double adjOpen;
  double adjVolume;
  double splitFactor;
  double dividend;
  String symbol;
  String exchange;
  String date;

  EndOfDayModel(
  {required this.open,
    required this.high,
    required  this.low,
    required this.close,
    required this.volume,
    required this.adjHigh,
    required this.adjLow,
    required this.adjClose,
    required this.adjOpen,
    required this.adjVolume,
    required this.splitFactor,
    required this.dividend,
    required this.symbol,
    required this.exchange,
    required this.date});

  factory EndOfDayModel.fromJson(Map<String, dynamic> json) {
    return EndOfDayModel(
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      volume: json['volume'],
      adjHigh: json['adj_high'],
      adjLow: json['adj_low'],
      adjClose: json['adj_close'],
      adjOpen: json['adj_open'],
      adjVolume: json['adj_volume'],
      splitFactor: json['split_factor'],
      dividend: json['dividend'],
      symbol: json['symbol'],
      exchange: json['exchange'],
      date: json['date'],

    );
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['open'] = this.open;
  data['high'] = this.high;
  data['low'] = this.low;
  data['close'] = this.close;
  data['volume'] = this.volume;
  data['adj_high'] = this.adjHigh;
  data['adj_low'] = this.adjLow;
  data['adj_close'] = this.adjClose;
  data['adj_open'] = this.adjOpen;
  data['adj_volume'] = this.adjVolume;
  data['split_factor'] = this.splitFactor;
  data['dividend'] = this.dividend;
  data['symbol'] = this.symbol;
  data['exchange'] = this.exchange;
  data['date'] = this.date;
  return data;
  }

}