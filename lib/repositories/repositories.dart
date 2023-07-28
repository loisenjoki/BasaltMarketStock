import 'dart:convert';
import 'dart:math';

import 'package:basalt_stock_market/utils/constants.dart';
import 'package:http/http.dart';

import '../models/eod.dart';
import '../models/ticker_model.dart';

class StockRepository {
  Future<List<TickerModel>> getTickers() async {
    Response response =
        await get(Uri.parse('$baseUrl$tickerUrl?access_key=$apiKey'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      List filteredData =
          result.where((item) => item['has_eod'] == true).toList();
      int numberOfRandomTickers = 10;
      List<int> randomIndices =
          generateRandomIndices(filteredData.length, numberOfRandomTickers);
      List<TickerModel> randomTickers = randomIndices
          .map((index) => TickerModel.fromJson(filteredData[index]))
          .toList();

      return randomTickers;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  List<int> generateRandomIndices(int dataLength, int numberOfIndices) {
    final random = Random();
    List<int> randomIndices = [];

    while (randomIndices.length < numberOfIndices && dataLength > 0) {
      int index = random.nextInt(dataLength);
      if (!randomIndices.contains(index)) {
        randomIndices.add(index);
      }
    }
    return randomIndices;
  }


  Future<List<EndOfDayModel>> getEoD(
      String filteredStartDate, String filteredEndDate, symbol) async {
    String startDate = filteredStartDate;
    String enddate = filteredEndDate;
    Response response = await get(Uri.parse('$baseUrl$EOD?access_key=$apiKey&symbols=$symbol&date_from=$startDate&date_to=$enddate'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => EndOfDayModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
