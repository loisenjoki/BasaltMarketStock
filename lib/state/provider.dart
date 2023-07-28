import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../repositories/repositories.dart';

class BaicUtilProvider extends ChangeNotifier {
  final StockRepository _tickerRepository = StockRepository();
  //  loading indicator
  bool _isloading = false;
  get isloading => _isloading;
  var _stockList;
  get stockList => _stockList;
  var _tickers;
  get tickers => _tickers;
  bool _isConnected = true;
  bool _isSeaching = false;
  get isSearching => _isSeaching;
  TextEditingController searchController = TextEditingController();


  bool get isConnected => _isConnected;

  toggleloading(bool loadvalue) {
    _isloading = loadvalue;
    if (_isloading) {
      FocusManager.instance.primaryFocus?.unfocus();
      notifyListeners();
    }
    notifyListeners();
  }

  void getEODList(filteredStartDate, filteredEndDate, symbol) async {
    toggleloading(true);
    try {
      final eodList = await _tickerRepository.getEoD(
          filteredStartDate, filteredEndDate, symbol);
      _stockList = eodList;
      toggleloading(false);
      notifyListeners();
    } catch (e) {
      log(e.toString() + "getEODList");
      toggleloading(false);
    }
  }

  toggleSearch(bool value) {
    _isSeaching = value;
    notifyListeners();
  }

  void getTickerList() async {
    toggleloading(true);
    try {
      final tickersList = await _tickerRepository.getTickers();
      _tickers = tickersList;
      toggleloading(false);
      notifyListeners();
    } catch (e) {
      log(e.toString() + "getEODList");
      toggleloading(false);
    }
  }

  void searchTickerList() async {
    toggleloading(true);
    var tickerList = _tickers;
    _tickers = tickerList
        .where((element) =>
    element.symbol
        .toLowerCase()
        .contains(searchController.text.toLowerCase()) ||
        element.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    searchController.clear();
    toggleloading(false);
  }

}

