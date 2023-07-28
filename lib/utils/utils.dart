import 'package:basalt_stock_market/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart'; // Add this import to access DateFormat

double difference = 0.0;
String startDate = "2023-05-01";
String endDate = "2023-07-01";

getDifference(double open, double close) {
  return difference = close - open;
}
convertDate(String date){
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat('dd:MM:yyy').format(parsedDate);
  return formattedDate;
}

Future<void> openCalender(BuildContext context, String symbol) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text(
              "Select Date Range",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
              height: 350,
              width: 300,
              child: Column(
                children: <Widget>[
                  getDateRangePicker(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          child: const Text("cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MaterialButton(
                          child: const Text("ok"),
                          onPressed: () {
                            // eodBloc.add(LoadEODEvent(startDate, endDate));
                            context.read<BaicUtilProvider>().getEODList(
                                startDate, endDate, symbol);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
}
Widget getDateRangePicker() {
  DateTime now = DateTime.now();
  return Card(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: _onSelectionChanged,
        maxDate: DateTime(
          now.year,
          now.month,
          now.day,
        ),
      ));
}

void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  if (args.value.startDate != null) {
    startDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(args.value.startDate);
  }
  if (args.value.endDate != null) {
    endDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(args.value.endDate);
  }
}